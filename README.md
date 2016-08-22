# XibImageValidator

A gem that ensures you have the proper image files that you've referenced in your XIBs.

## Installation

    $ gem install xib_image_validator

## Usage

	$ validate_xib [dirname] [options]
    -v, --verbose                    Output diagnosic info
    -s, --storyboard                 Additionally, scan storyboard files
    -h, --help                       Show help message

The script will run over all .XIB files in the directory recursively, looking for all `<image>`, `<imageView>` and `<state>` (UIButton control state) tags, extracting image names and checking whether said image can be found in the directory. 

It does not perform advanced checks like ensuring the files are within asset catalogs or in the "Copy Bundle Resources" build phase or even in the right target, although it might be a good idea to add this functionality later.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/igor-makarov/xib-image-validator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

