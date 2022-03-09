import { Profile } from './profile';
import { join } from 'path';
import { runStream } from '../process';

export default class MacosWork extends Profile {
  constructor() {
    super();
  }

  async os () {
    const macos_script = join(process.cwd(), '../macos', 'defaults.sh');
    return runStream(macos_script, [], 'inherit');
  }

  async app () {
    const brew_script = join(process.cwd(), '../install', 'brew.sh');
    const brew_cask_script = join(process.cwd(), '../install', 'brew-cask.sh');
    await runStream(brew_script, [], 'inherit')
    return runStream(brew_cask_script, [], 'inherit');
  }

}
