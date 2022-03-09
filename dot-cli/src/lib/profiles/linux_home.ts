import { Profile } from './profile';
import {runStream} from "../process";

export default class LinuxHome extends Profile {
  profile = 'linux_home';

  constructor() {
    super();
  }

  async app () {
    const apts = [
      'nodejs',
      'npm',
      'fonts-powerline',
      'heif-gdk-pixbuf',
      'libheif-examples'
    ];

    return runStream(`sudo apt install ${apts.join(' ')}`, [], 'initial');
  }

  async os () {
    return super.os();
  }

  async clean () {
    return super.clean();
  }

  async npm () {
    return super.npm();
  }

  async symlinks () {
    return super.symlinks();
  }

  async terminal () {
    return super.terminal();
  }

}
