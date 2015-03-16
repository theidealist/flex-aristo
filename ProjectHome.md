# AristoLib #

AristoLib is a Flex library (.SWC) project that, when included in a standard Flex project, will provide an
application with the Aristo style developed by 280 North in conjunction with the Cappuccino project.  It
attempts to approximate the CSS3 styles published by "maccman" (http://github.com/maccman/aristo) and is
based on the graphical assets he has pulled from the original photoshop file provided by 280 North.  See the
AristoExample application for a basic example of how to use some of the non-standard controls.

![http://flex-aristo.googlecode.com/files/preview.png](http://flex-aristo.googlecode.com/files/preview.png)

Aristo is an open source UI distributed as part of the Cappuccino Open Source Framework (http://cappuccino.org)
and specifically designed for the cross platform challenges applications face today. It is a collaborative
effort by 280 North, Inc. and Sofa and released under the Creative Commons Attribution Share-Alike License.
This license is included in this project in the file named "License-Aristo-style.txt" and is available online
here: http://creativecommons.org/licenses/by-sa/3.0/us/

## 1.  Licensing ##

> This project's library code is licensed, where appropriate, under the MIT License.  This license is
> included in this project in the file named "License-AristoLib-flex\_style\_lib.txt", at the top of
> each source file and is available online here: http://opensource.org/licenses/mit-license.php

> Note that the MIT License only applies to new code added by this project -- the graphics remain licensed
> under the Creative Commons Attribution Share-Alike License.  This license is included in this project in
> the file named "License-Aristo-style.txt" and is available online here:
> http://creativecommons.org/licenses/by-sa/3.0/us/

> The project's example code is considered public domain; no rights reserved, without warranty expressed
> or implied.

## 2.  Usage ##

> There is a sample application project which should be referenced for details on how to use this library
> in an application of your own.  For the most part the library should just drop-in, however there are
> a few limitations in the flex API that require certain Aristo classes to be used in place of standard
> Flex classes.

## 3.  Notable departures from Aristo standard ##

> The most notable departure in this library from the Aristo standard is the usage of the freely available
> and redistributable "Droid" fonts in place of the "Arial" fonts delineated by the Aristo style guideline.
> This decision was made because Flex requires fonts to be bundled and Arial is not a freely redistributable
> font; it requires a valid license which may not be available in all locations where the SWC will be used.
> The Droid fonts do not have this limitation; they are licensed under an Apache license which is available
> as part of this library project in the "License-Droid-fonts.txt" file.