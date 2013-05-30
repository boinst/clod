# This script is primarily intended for use internally within CLOD scripts.
# We use it to download files from the Internet, especially when wget is
# not available.

(new-object System.Net.WebClient).DownloadFile($args[0], $args[1])