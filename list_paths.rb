# frozen_string_literal: true

# this little guy just prints all the folder paths in the repo for ChatGPT to understand

def ignore_folder?(path)
  folders_to_ignore = %w[node_modules test tmp spec]

  folders_to_ignore.any? { |folder| path.include?("/#{folder}/") }
end

def print_folders(directory)
  Dir.glob("#{directory}/**/*").select do |path|
    File.directory?(path) && !ignore_folder?(path)
  end.each do |folder|
    puts folder
  end
end

repository_path = '/workspaces/planner_app_2'

print_folders(repository_path)
