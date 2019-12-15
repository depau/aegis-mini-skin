# Custom skin for Geekvape Aegis Mini

3D-printable custom skin for the Aegis Mini. Made with OpenSCAD.

[![IMG-20191216-003557](https://i.postimg.cc/QVD2Cwwv/IMG-20191216-003557.jpg)](https://postimg.cc/QVD2Cwwv) [![IMG-20191216-003615](https://i.postimg.cc/hh0HdMqv/IMG-20191216-003615.jpg)](https://postimg.cc/hh0HdMqv) [![IMG-20191216-004005](https://i.postimg.cc/SJNH78yr/IMG-20191216-004005.jpg)](https://postimg.cc/SJNH78yr)

*(sorry for the magic numbers in the code :/)*

## Download

All STLs are in the `stl/` folder.

## Printing

I advise you print it with the rounded part facing up and support
material enabled, in order to get a smoother looking skin.

Please share your experience if you find a printing position that
looks better.

You may also want to print the big button with support material,
so that the button pusher doesn't fall apart. The small buttons
should do fine without.

## Build

To build the part, run `make`. You will find the STL in the `stl`
directory.

On Windows/Mac you need to set the
path to OpenSCAD.

```bash
make SCADC=/path/to/openscad
```

## Customizing

`skin.scad` is quite complex. It takes something like 10 seconds to
just render the preview on my machine, and around a minute to render
the final model.

For this reason, I split the model in different modules which can
optionally be pre-rendered and included as STL.

If you need to do edits, edit `config.scad` and, at the bottom of the
file, set to `false` all the parts you don't need to build. It will
speed up the rendering by orders of magnitude.

When you're done, before rendering the final part, set them all to
`true` to get a more accurate result.

To rebuild the STL stubs, run `make stubs`.

## License

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
