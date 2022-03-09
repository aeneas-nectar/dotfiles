import { runStream } from '../process';
import {buildSymlinks, manageFile} from "../symlinkUtils";
import {repoDir} from "../../config";

export class Profile {
  profile: string;

  constructor (profile: string) {
    this.profile = profile;
  }
  async os (): Promise<any> {
    console.log(`os command: ${this.profile}`)
  }

  async app (): Promise<any> {
    console.log(`app command: ${this.profile}`)
  }

  async clean (): Promise<any> {
    console.log(`clean command: ${this.profile}`)
  }

  async npm (): Promise<any> {
    const modules = ['commitizen', 'ipt'];
    const cmd = `npm -g install ${modules.join(' ')}`;
    console.log('running', cmd);
    return runStream(cmd, [], 'inherit');
  }

  async symlinks (): Promise<any> {
    const symlinks = {
      [`${repoDir}/profiles/${this.profile}/dotfiles/.zsh_functions`]: '.zsh_functions',
      [`${repoDir}/profiles/${this.profile}/dotfiles/.zprofile`]: '.zprofile',
      [`${repoDir}/profiles/${this.profile}/dotfiles/.zshenv`]: '.zshenv',
      [`${repoDir}/profiles/${this.profile}/dotfiles/.zshrc`]: '.zshrc',
    };
    return await buildSymlinks(symlinks);
  }

  async terminal(): Promise<any> {
    await runStream(`git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh`, [], 'inherit');
    await runStream(`git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" --depth=1`, [], 'inherit');
    return await manageFile("$ZSH/themes/spaceship-prompt/spaceship.zsh-theme", "$ZSH/themes/spaceship.zsh-theme");
  }


}
