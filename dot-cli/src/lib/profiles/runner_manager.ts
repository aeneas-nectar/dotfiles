import MacosWork from "./macos_work";
import LinuxHome from "./linux_home";
import { Profile } from './profile';

export default function runner_manager (profile: string) {
  if (profile === 'linux_home') {
    return new LinuxHome();
  } else if (profile === 'macos_work') {
    return new MacosWork();
  } else {
    return new Profile(profile)
  }
}
