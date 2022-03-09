import MacosWork from "./macos_work";
import LinuxHome from "./linux_home";
import { Profile } from './profile';

export const profiles: {[id: string]: string} = {
  linux_home: 'linux_home',
  macos_work: 'macos_work'
};

export default function runner_manager (profile: string): Profile {

  switch (profile) {
    case profiles.linux_home:
      return new LinuxHome();
    case profiles.macos_work:
      return new MacosWork();
    default:
      return new Profile();
  }
}
