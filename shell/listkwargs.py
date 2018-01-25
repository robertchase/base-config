import argparse
import sys
from ergaleia.to_args import to_args

parser = argparse.ArgumentParser()
parser.add_argument('-k', '--key')
parser.add_argument('-n', '--no_value', default=False, action='store_true')
args = parser.parse_args()

for line in sys.stdin.readlines():
    _, kwargs = to_args(line)
    if args.key:
        print(kwargs.get(args.key))
    else:
        print(
            ' '.join(
                '{}={}'.format(
                    k,
                    '*' if args.no_value else v,
                ) for k, v in kwargs.items()
            )
        )
