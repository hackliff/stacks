# -*- coding: utf-8 -*-
# vim:fenc=utf-8

## Generators -----------------------------------------------------------------
## Original article: http://www.programiz.com/python-programming/generator

# creates an iterator which is lazy loaded and hence much more memory efficient
def lazy(my_list):
    return (x**2 for x in my_list)


## MISC -----------------------------------------------------------------------

# export your ipython history (to write a script after tinkering in the shell
# for example). `-g` option would pull the entire history
%history -f ./ipython.hist

# Generate random ratios for, say, fake AB tests
def random_ratio():
    people_in_branch = 50
    control, experiment = np.random.rand(2, people_in_branch)
    # compute number of successes
    print(sum(experiment < 0.176))


def make_struct(**kwargs):
    """Create an Enum type from a dictionnary.

    Args:
        kwargs(dict): key/value pairs that should become struct attributes

    Returns:
        (Enum): Struct container

    >>> car = make_struct(model='black', name='BATMOBILE')
    >>> print(car.name)
    'BATMOBILE'
    """
    return type('Enum',  # type name
                (),      # bases
                kwargs)


## Can use class methods to make multiple constructors ------------------------
# http://stevenloria.com/python-best-practice-patterns-by-vladimir-keleshev-notes/
class Point(object):
    def __init__(self, x, y):
        self.x, self.y = x, y

    @classmethod
    def polar(cls, r, theta):
        return cls(r * cos(theta),
                   r * sin(theta))

point = Point.polar(r=13, theta=22.6)


## Merge configurations
class Config:
    def __init__(self, **entries):
        self.entries = entries

    def __add__(self, other):
        entries = (self.entries.items() +
                   other.entries.items())
        return Config(**entries)

default_config = Config(color=False, port=8080)
config = default_config + Config(color=True)
