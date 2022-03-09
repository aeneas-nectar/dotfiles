import {Command, Flags} from '@oclif/core'
import runner_manager from "../lib/profiles/runner_manager";

export default class Os extends Command {
  static description = 'Setup OS-specific preferences'

  static examples = [
    '<%= config.bin %> <%= command.id %>',
  ]

  static args = [{name: 'profile'}]

  public async run(): Promise<void> {
    const {args} = await this.parse(Os)
    const { profile } = args;
    this.log(`executing with following profile: ${profile}`);
    const runner = runner_manager(profile);
    await runner.os();
    this.log(`completed os setup`);
  }
}
