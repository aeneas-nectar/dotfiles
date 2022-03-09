import { homedir } from "os";

export const homeDir = homedir();
// NOTE: This is the same as `this.config.configDir` inside a command function
export const configDir = `${homeDir}/.config/dotfiles`
export const repoDir = `${homeDir}/dotfiles`
