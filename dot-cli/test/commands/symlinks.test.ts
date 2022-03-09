import {expect, test} from '@oclif/test'

describe('symlinks', () => {
  test
  .stdout()
  .command(['symlinks'])
  .it('runs hello', ctx => {
    expect(ctx.stdout).to.contain('hello world')
  })

  test
  .stdout()
  .command(['symlinks', '--name', 'jeff'])
  .it('runs hello --name jeff', ctx => {
    expect(ctx.stdout).to.contain('hello jeff')
  })
})
