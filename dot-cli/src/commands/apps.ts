import {Command} from '@oclif/core'
import runner_manager from "../lib/profiles/runner_manager";

export default class Apps extends Command {
  static description = 'Install os-specific applications and libraries'

  static examples = [
    '<%= config.bin %> <%= command.id %>',
  ]

  static args = [{name: 'profile'}]

  public async run(): Promise<void> {
    const {args} = await this.parse(Apps)
    const { profile } = args;
    this.log(`executing with following profile: ${profile}`);
    const runner = runner_manager(profile);
    await runner.app();
    this.log(`completed os setup`);
  }
}
