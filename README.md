### Words

This project is a solution to the problem described in this gist:
https://gist.github.com/pedromartinez/7788650

### Running it

The program reads from stdin and writes to two files, sequences.txt
and words.txt.  E.g.,

```
$ ruby run.rb < dictionary.txt
```

### Running the specs

There's a bundler file which basically has only rspec in it. So you
can either use that (shown below), or install the requisite rspec gem(s) 
manually if that's how you roll.

```
$ bundle install
$ bundle exec rspec
```

### Assumptions
- The output in the sample gist showed the sequences in alphabetical
  order, but the problem statement made no mention of this as a requirement.
  For this solution, I assumed that sorting the output is not a 
  requirement; the only rule with respect to ordering is that for
  any line number X in sequences.txt, the line number X in words.txt
  corresponds.
- Input lines from dictionary.txt which do not meet the [A-z] pattern 
  specified in the problem statement are simply ignored rather than,
  e.g., an exception being raised. If this is not the desired behavior,
  then line 10 of lib/sequences.rb can be uncommented (but this will
  cause the two sequences specs which enforce the no-exceptions behavior
  to fail).