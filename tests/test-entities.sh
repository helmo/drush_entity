#!/bin/bash

# TODO This is a very simple test script
# Run this from the terminal from within a drupal root
# ~/.drush/drush_entity/tests/test-entities.sh

# We write output to a file so errors pop up easily.
OUTPUT=$TMPDIR/drush.entity.log

# We prefer properties as these are human readable
FORMAT=properties

function stamp {
  echo ============== >> $OUTPUT
  echo timestamp : `date` >> $OUTPUT
  echo ============== >> $OUTPUT
}

echo > $OUTPUT
stamp

drush --format=$FORMAT etr >> $OUTPUT
stamp

drush --format=$FORMAT etr `drush etr` >> $OUTPUT
stamp

drush --format=$FORMAT etr `drush etr` --fields="*/bundle" >> $OUTPUT
stamp

less $OUTPUT

rm $OUTPUT