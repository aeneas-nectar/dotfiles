import {Command, Flags} from '@oclif/core'
import runner_manager from "../lib/profiles/runner_manager";

export default class Terminal extends Command {
  static description = 'describe the command here'

  static examples = [
    '<%= config.bin %> <%= command.id %>',
  ]


  static args = [{name: 'profile'}]

  public async run(): Promise<void> {
    const {args} = await this.parse(Terminal);
    const { profile } = args;
    this.log(`executing with following profile: ${profile}`);
    const runner = runner_manager(profile);
    await runner.terminal();
    this.log(`completed terminal setup`);
  }
}
