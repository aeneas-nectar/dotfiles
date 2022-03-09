import {homeDir, repoDir} from "../config";
import { readlink as _readlink, symlink as _symlink, rename as _rename, unlink as _unlink, mkdir as _mkdir, lstat as _lstat } from 'fs';
import { basename, dirname, resolve } from 'path';
import { promisify } from 'util';

const readlink = promisify(_readlink)
const symlink = promisify(_symlink)
const rename = promisify(_rename)
const unlink = promisify(_unlink)
const mkdir = promisify(_mkdir)
const lstat = promisify(_lstat)

/***
 * Determine if the target at `linkpath` is the same as the resolved filepath
 * within the dotfiles repository.
 *
 * @param {string} filepath filepath (source) of a symlink
 * @param {string} linkpath linkpath (target) of a symlink
 * @returns {boolean} Boolean value of equality of path locations
 */
async function isValidLinkpath(filepath: string, linkpath: string) {
  const rp = await readlink(linkpath)
  return (rp === resolve(repoDir, filepath))
}

/***
 * Determine if the target of `linkpath` is a file or not.
 *
 * @param {string} linkpath linkpath (target) of a symlink
 * @returns {(null|fs.Stats)} Result from lstat or null.
 */
async function doesFileExist(linkpath: string) {
  try {
    const stat = await lstat(linkpath)
    return stat
  } catch (error: any) {
    if (error.code === 'ENOENT') {
      // File doesn't exist
      return null
    }
    console.error(error)
  }
}

/***
 * Rename given file in order to create a backup. Results in `filename`.bak.
 *
 * @param {string} filepath path to the file to be renamed
 */
async function doRename(filepath: string) {
  try {
    await rename(filepath, `${filepath}.bak`)
  } catch (error: any) {
    // Probably an access error
    console.error(error)
  }
}

/***
 * Symlink the source `filepath` to the target `linkpath`.
 *
 * @param {string} filepath source for symlink
 * @param {string} linkpath target for symlink
 * @param {Object} [opts] options object
 * @param {boolean} [opts.force] force symlink creations
 */
async function makeSymlink(filepath: string, linkpath: string, opts: {force?: boolean } = {}) {
  if (opts.force) {
    await unlink(linkpath)
  }
  if (dirname(linkpath) !== homeDir) {
    // Need to make directories
    await mkdir(dirname(linkpath), { recursive: true })
  }
  await symlink(filepath, linkpath)
}

export async function manageFile(filepath: string, linkpath: string) {
  const filename = basename(filepath)
  console.log(`linking ${filename} to ${linkpath} ...`)

  const stat = await doesFileExist(linkpath)
  if (stat) {
    // File exists
    if (stat.isSymbolicLink()) {
      // Validate symbolic link
      const isValid = await isValidLinkpath(filepath, linkpath)
      if (!isValid) {
        await makeSymlink(filepath, linkpath, { force: true })
      }
      // Symbolic link path is correct; do nothing
    } else {
      // Not symbolic link; rename, and link
      await doRename(linkpath) // backup file
      await makeSymlink(filepath, linkpath)
    }
  } else {
    // linkpath doesn't exist; symlink it
    await symlink(filepath, linkpath)
  }
}

export async function buildSymlinks(symlinks: {[id:string]: string}) {
  const promiseLinks = []
  for (const [ source, target ] of Object.entries(symlinks)) {
    const filepath = resolve(repoDir, source)
    const linkpath = resolve(homeDir, target)
    promiseLinks.push(manageFile(filepath, linkpath))
  }
  await Promise.all(promiseLinks);
}
