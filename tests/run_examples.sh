#!/bin/bash

# sc_drop_2d requires an active display (uses Matplotlib).
blacklist="examples/ldc_2d_unorm.py examples/ternary_fluid/sc_drop_2d.py"

find examples -perm -0111 -name '*.py' | while read filename ; do
	if [[ ${blacklist/${filename}/} == ${blacklist} ]]; then
		echo -n "Testing ${filename}..."
		if ! python $filename --max_iters=10 --quiet ; then
			echo "failed"
		else
			echo "ok"
		fi
	fi
done
