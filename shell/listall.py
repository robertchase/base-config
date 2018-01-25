import sys
from ergaleia.to_args import to_args

for line in sys.stdin.readlines():
    args, kwargs = to_args(line)
    args = ' '.join(str(a) for a in args)
    kwargs = ' '.join('{}=*'.format(k) for k in kwargs.keys())
    print(args + ' ' + kwargs)
