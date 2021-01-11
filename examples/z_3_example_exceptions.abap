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
    data static_exception type ref to casdk_cx_static_exception.
    data dynamic_exception type ref to casdk_cx_dynamic_exception.

    try.
        "Raise the base static exception
        new casdk_cx_static_exception(
            msgv1 = 'Error (Part 1).' "Optional Parameter
            msgv2 = 'Error (Part 2).' "Optional Parameter
            msgv3 = 'Error (Part 3).' "Optional Parameter
            msgv4 = 'Error (Part 4).' "Optional Parameter
        )->raise_exception(  ).
    catch casdk_cx_static_exception into static_exception.
        casdk_cl_utils=>print( 'Example 1: ' ).
        casdk_cl_utils=>println( static_exception ).
    endtry.

    try.
        "Raise the base dynamic exception
        new casdk_cx_dynamic_exception( msgv1 = 'Runtime_Error' )->raise_exception( ).
    catch casdk_cx_dynamic_exception into dynamic_exception.
        casdk_cl_utils=>print( 'Example 2: ' ).
        casdk_cl_utils=>println( dynamic_exception ).
    endtry.

    try.
        "Raise a null pointer exception
        new casdk_cx_nullpointer( msgv1 = 'Null_Pointer_Error' )->raise_exception(  ).
    catch casdk_cx_nullpointer into dynamic_exception.
       casdk_cl_utils=>print( 'Example 3: ' ).
       casdk_cl_utils=>println(  dynamic_exception ).
    endtry.

    try.
        "Raise a cast error exception
        new casdk_cx_cast_error( msgv1 = 'Cast_Error' )->raise_exception(  ).
    catch casdk_cx_cast_error into dynamic_exception.
       casdk_cl_utils=>print( 'Example 4: ' ).
       casdk_cl_utils=>println(  dynamic_exception ).
    endtry.

    try.
        "Raise a number format exception
        new casdk_cx_numberformat( msgv1 = 'Number_Format_Error' )->raise_exception(  ).
    catch casdk_cx_numberformat into dynamic_exception.
        casdk_cl_utils=>print( 'Example 5: ' ).
        casdk_cl_utils=>println( dynamic_exception ).
    endtry.

    try.
        "Raise a number format exception
        new casdk_cx_arithmetic( msgv1 = 'Arithmetic_Error' )->raise_exception(  ).
    catch casdk_cx_arithmetic into dynamic_exception.
        casdk_cl_utils=>print( 'Example 6: ' ).
        casdk_cl_utils=>println( dynamic_exception ).
    endtry.