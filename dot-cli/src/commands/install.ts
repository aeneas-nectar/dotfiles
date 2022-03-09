import {Command} from '@oclif/core'
import runner_manager from "../lib/profiles/runner_manager";

export default class Install extends Command {
  static description = 'Full installation of all components'

  static examples = [
    '<%= config.bin %> <%= command.id %>',
  ]

  static args = [{name: 'profile'}]

  public async run(): Promise<void> {
    const {args} = await this.parse(Install)
    const { profile } = args;
    this.log(`executing with following profile: ${profile}`);
    const runner = runner_manager(profile);
    await runner.app();
    await runner.npm();
    await runner.symlinks();
    await runner.terminal();
    await runner.os();
    this.log('completed installation');
  }
}
