import {Command, Flags} from '@oclif/core'
import { resolve } from 'path';
import runner_manager from "../lib/profiles/runner_manager";

import { manageFile } from "../lib/symlinkUtils";

import {
  repoDir,
  homeDir,
} from '../config';

export default class Symlinks extends Command {
  static description = 'create symlinks between home directory and profile-specific versions within the dotfiles repo'

  static examples = [
    '<%= config.bin %> <%= command.id %>',
  ]

  static flags = {
    force: Flags.boolean({
      char: 'f',
      description: 'force symlink creation',
    }),
  }

  static args = [{name: 'profile'}]

  public async run(): Promise<void> {
    const {args} = await this.parse(Symlinks)
    const { profile } = args;

    const runner = runner_manager(profile);
    await runner.symlinks();
    this.log('completed symlinks setup');
  }


}
