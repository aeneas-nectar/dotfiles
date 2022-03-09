import { Profile } from './profile';
import {runStream} from "../process";

export default class LinuxHome extends Profile {
  constructor() {
    super('linux_home');
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
}
