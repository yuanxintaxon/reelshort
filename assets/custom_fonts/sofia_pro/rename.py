import os
# Rename all files in the current directory spaces with '-'
def rename_files_in_current_directory():
    # Get the current directory
    directory = os.getcwd()

    # Iterate through files in the current directory
    for filename in os.listdir(directory):
        # Split the filename and extension
        name, extension = os.path.splitext(filename)
        
        # Replace spaces with '-' and convert to lower case
        new_name = name.replace(' ', '-').lower() + extension
        
        if new_name != filename:
            # Construct full file paths
            current_path = os.path.join(directory, filename)
            new_path = os.path.join(directory, new_name)
            
            # Rename the file
            os.rename(current_path, new_path)
            print(f'Renamed: {filename} -> {new_name}')

# Call the function to rename files in the current directory
rename_files_in_current_directory()
