import {Command, Flags} from '@oclif/core'

import { profiles } from "../lib/profiles/runner_manager";

export default class Profiles extends Command {
  static description = 'list all the available profiles'

  public async run(): Promise<void> {
    Object.keys(profiles).forEach(profile => {
      this.log(profile);
    })
  }
}
