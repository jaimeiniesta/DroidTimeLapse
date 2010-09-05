##########################################################################
# DroidStopMotion
# A tiny little script to take photos from android on a specified interval
##########################################################################

# Define dirs and constants
APP_DIR = File.expand_path File.dirname(__FILE__)
SETUP_WAIT = 10

# Ask user for instructions
# Welcome screen
puts "### DroidStopMotion ###\n"

# Number of seconds to wait after each picture
puts "How many seconds should I wait after each photo?"
WAIT = gets.chomp.to_i

# Number of pictures to be taken in total
puts "How many pictures should we take in total?"
NUM_PICTURES = gets.chomp.to_i

# Require and initialize Android API
require "android"
DROID = Android.new

# Give time to position the camera
puts "Please position your camera."
puts "Photo capturing will begin in #{SETUP_WAIT} seconds"
sleep SETUP_WAIT

# Loop and take pictures
album_name = Time.now.strftime('%Y/%m/%d/%H_%M')
counter = 0
NUM_PICTURES.times do
  puts "Taking picture #{counter += 1}..."
  snapshot_path = File.join APP_DIR, "droidstopmotion/albums/#{album_name}/#{Time.now.strftime('%Y%m%d_%H%M%S')}.jpg"
  DROID.cameraCapturePicture snapshot_path
  
  puts "#{NUM_PICTURES - counter} pictures remaining. Sleeping #{WAIT} seconds..."
  sleep WAIT
end

puts "Finished!"