import { Profile } from './profile';
import {runStream} from "../process";

export default class LinuxHome extends Profile {
  profile = 'linux_home';

  constructor() {
    super();
  }

  async addRepositories () {
    //install docker's pgp key
    await runStream(`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/keyrings/share/docker-archive-keyring.gpg`, [], 'inherit')
    // add docker ppa repository: note it's for FOCAL, which differs from
    // the guide on docker, since their script recognizes jolpnir which
    // doesn't have a match
    await runStream(`echo \                        
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  focal sudo" | stable tee /etc/apt/sources.list.d/docker.list > /dev/nul`, [], 'inherit');

    //add table plus pgp key
    await runStream(`wget -qO - http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -`, [], 'inherit');
    return runStream(`sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/20 tableplus main"`, [], 'inherit');
  }


  async addDockerContainers () {
    
  }

  async app () {
    const apts = [
      'nodejs',
      'npm',
      'fonts-powerline',
      'heif-gdk-pixbuf',
      'libheif-examples',
      'docker-ce',
      'docker-ce-cli',
      'containerd.io',
      'software-properties-common',
      'tableplus',
      'git-flow',
      'kdeconnect'
    ];
    
    await this.addRepositories();

    return runStream(`sudo apt install`, apts, 'inherit');
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
