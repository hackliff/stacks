# Python

## Generators

- [Original article](http://www.programiz.com/python-programming/generator)

- Generator = `yield` instead of return, i.e. pause iteration, save state,
and continue later where we left it.

- `(x**2 for x in my_list)` creates an iterator which is lazy loaded and
  hence much more memory efficient.

- They are more concise and readable to write.


## Statistics

- Generate random ratios for, say, fake AB tests

```Python
people_in_branch = 50
control, experiment = np.random.rand(2, people_in_branch)

# compute number of successes
print(sum(experiment < 0.176))
```
