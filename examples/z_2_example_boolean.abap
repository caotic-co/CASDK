*--------------------------------------------------------------*
* Example z_2_example_boolean                                  *
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

"! Example program that shows the use of casdk boolean objects
report z_2_example_boolean.

include: z_casdk_definition, z_casdk_implementation.

start-of-selection.
    "New true object
    data(true_obj) = casdk_cl_boolean=>true(  ).
    casdk_cl_console=>print( 'Example 1: ' ).
    casdk_cl_console=>println( true_obj ). "Prints 'true'

    "New false object
    data(false_obj) = casdk_cl_boolean=>false(  ).
    casdk_cl_console=>print( 'Example 2: ' ).
    casdk_cl_console=>println( false_obj ). "Prints 'false'

    "AND between Boolean objects
    data(and_operation) = casdk_cl_boolean=>logical_and( a = true_obj b = false_obj ).
    casdk_cl_console=>print( 'Example 3: ' ).
    casdk_cl_console=>println( casdk_cl_boolean=>value_of( and_operation ) ). "Prints 'false'

    "OR between Boolean objects
    data(or_operation) = casdk_cl_boolean=>logical_or( a = true_obj b = false_obj ).
    casdk_cl_console=>print( 'Example 4: ' ).
    casdk_cl_console=>println( casdk_cl_boolean=>value_of( or_operation ) ). "Prints 'true'

    "NOT of a Boolean object
    data(not_obj) = casdk_cl_boolean=>logical_not( true_obj ).
    casdk_cl_console=>print( 'Example 5: ' ).
    casdk_cl_console=>println( casdk_cl_boolean=>value_of( not_obj ) ). "Prints 'false'

    "Nested Logical Operations
    data(complex_operation) = casdk_cl_boolean=>logical_and(
        a = casdk_cl_boolean=>logical_or( a = true_obj b = false_obj )
        b = casdk_cl_boolean=>logical_or( a = true_obj b = false_obj )
    ).
    casdk_cl_console=>print( 'Example 6: ' ).
    casdk_cl_console=>println( casdk_cl_boolean=>value_of( complex_operation ) ). "Prints 'true'

    "Use of objects on if statements
    data(boolean) = casdk_cl_boolean=>true(  ).
    casdk_cl_console=>print( 'Example 7: ' ).
    if boolean->get_value(  ) = casdk_true.
        casdk_cl_console=>println( 'The Boolean value is true' ).
    else.
        casdk_cl_console=>println( 'The Boolean value is false' ).
    endif.

    "Compare two Boolean objects
    data(boolean1) = casdk_cl_boolean=>true(  ).
    data(boolean2) = casdk_cl_boolean=>false(  ).
    casdk_cl_console=>print( 'Example 8: ' ).
    if boolean1->equals( boolean2 ) = casdk_true.
        casdk_cl_console=>println( ' The two Booleans are equal' ).
    else.
        casdk_cl_console=>println( 'The two Booleans are not equal' ).
    endif.