import {exec, spawnSync} from "child_process";


export function run (cmd: string, maxBuffer = 512000, cwd = '.'): Promise<string> {
  return new Promise((resolve, reject) => {
    exec(cmd, { maxBuffer, cwd }, (error: Error | null, stdout: string | null, stderr: string | null) => {
      if (error !== null) {
        reject(error);
      } else if (stdout !== null) {
        resolve(stdout);
      } else if (stderr !== null) {
        reject(stderr);
      }
    });
  });
}

export function runStream (cmd: string, args: string[], stdio = 'pipe', expectNoOutput = false, cwd = '', env: any = null) {
  return new Promise((resolve, reject) => {
    const spawnOpts: any = { encoding: 'utf8', stdio };
    if (cwd) {
      spawnOpts.cwd = cwd;
    }
    if (env) {
      spawnOpts.env = env;
    }
    const child = spawnSync(cmd, args, spawnOpts);
    if (stdio !== 'pipe') {
      return resolve(child);
    }
    if (child.status === 0 && (child.stderr !== '' || expectNoOutput)) {
      resolve(child.stderr);
    } else if (child.status === 0 && (child.stdout !== '' || expectNoOutput)) {
      resolve(child.stdout);
    } else {
      if (child.output && child.output.length) {
        reject(child.output.filter((o: any) => !!o));
      }

      reject('unknown error');
    }
  });
};
