# Compound Operators - old and new.

Little test of compound operators in Flash. In the legacy flash compiler, the left hand side of a compound operator would be executed twice if it was complex. I hoped the new compiler would not do this, but it does. Boo.

For an old delve into the bytecode produced by the legacy compiler, see:

- [Compound Operators, New and You.](http://noiseandheat.com/blog/2010/02/compound-operators-new-and-you/)

To compile this example with the supplied `Rakefile`:

1. make sure you first have `Ruby` installed and `rake`.
1. Edit `build.yml` and change `:legacy_sdk:` and `:asc2_sdk:` to point to wherever your compilers are.

Finally, simple run `rake` from the commandline and 2 swfs will be compiled and output into the `bin` folder along with their decompiled abc.
