*--------------------------------------------------------------*
* Test z_0_test_utils                                        *
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

"! Tests for casdk_utils
report z_0_test_utils.

include: z_casdk_definition, z_casdk_implementation.

class utils_tests definition for testing duration short risk level harmless.
    public section.
        "! Validates references are correctly evaluated
        methods is_pointer for testing.

        "! Validates empty references are correctly evaluated
        methods is_null_pointer for testing.
endclass.
class utils_tests implementation.
    method is_pointer.
        data obj type ref to casdk_object.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_utils=>is_pointer( obj )
            msg = 'CASE 1: The given object is not a pointer'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_utils=>is_pointer( 'Not a pointer' )
            msg = 'CASE 2: The given object shoud not be a pointer'
        ).
    endmethod.

    method is_null_pointer.
        data obj type ref to casdk_object.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_utils=>is_null_pointer( obj )
            msg = 'CASE 1: The given object is not a null pointer'
        ).

        obj = new casdk_object(  ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_utils=>is_null_pointer( obj )
            msg = 'CASE 2: The given object shoud not be a null pointer'
        ).
    endmethod.
endclass.