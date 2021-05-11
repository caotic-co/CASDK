*--------------------------------------------------------------*
* Example z_3_example_exceptions                               *
*--------------------------------------------------------------*
* Author: Camilo A. Ospina A.                                  *
* Version: 1.0.0                                               *
* Original Source Code: https://github.com/caotic-co/CASDK     *
*--------------------------------------------------------------*
*                        MIT License                           *
*                                                              *
*                    Copyright (c) CAOTIC                      *
*                                                              *
* Permission is hereby granted, free of charge, to any person  *
* obtaining a copy of this software and associated             *
* documentation files (the "Software"), to deal in the         *
* Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, *
* sublicense, and/or sell copies of the Software, and to       *
* permit persons to whom the Software is furnished to do so,   *
* subject to the following conditions:                         *
*                                                              *
* The above copyright notice and this permission notice shall  *
* be included in all copies or substantial portions of the     *
* Software.                                                    *
*                                                              *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY    *
* KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE   *
* WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR      *
* PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS   *
* OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR     *
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR   *
* OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE    *
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.       *
*--------------------------------------------------------------*

"! Example program that shows the use of casdk exceptions
report z_3_example_exceptions.

include: z_casdk_definition, z_casdk_implementation.

start-of-selection.
    data ex type ref to casdk_exception.
    data e type ref to casdk_runtime_exception.

    try.
        "Raise the base static exception
        new casdk_exception(
            msgv1 = 'Error (Part 1).' "Optional Parameter
            msgv2 = 'Error (Part 2).' "Optional Parameter
            msgv3 = 'Error (Part 3).' "Optional Parameter
            msgv4 = 'Error (Part 4).' "Optional Parameter
        )->raise_exception(  ).
    catch casdk_exception into ex.
        casdk_console=>print( 'Example 1: ' ).
        casdk_console=>println( ex ).
    endtry.

    try.
        "Raise the base runtime exception
        new casdk_runtime_exception( msgv1 = 'Runtime_Error' )->raise_exception( ).
    catch casdk_runtime_exception into e.
        casdk_console=>print( 'Example 2: ' ).
        casdk_console=>println( e ).
    endtry.

    try.
        "Raise a null pointer exception
        new casdk_nullpointer_exception( msgv1 = 'Null_Pointer_Exception' )->raise_exception(  ).
    catch casdk_nullpointer_exception into e.
       casdk_console=>print( 'Example 3: ' ).
       casdk_console=>println( e ).
    endtry.