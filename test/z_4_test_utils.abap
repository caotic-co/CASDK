*--------------------------------------------------------------*
* Test z_4_test_utils                                        *
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

"! Tests for casdk_cl_utils
report z_4_test_utils.

include: z_casdk_definition, z_casdk_implementation.

class tests_cl_utils definition for testing duration short risk level harmless.
    public section.
        "! Validates references are correctly evaluated
        methods is_pointer for testing.

        "! Validates empty references are correctly evaluated
        methods is_null_pointer for testing.

        "! Validates if a variable has a string type.
        methods is_string for testing.

        "! Validates if a variable has a numeric type.
        methods is_numeric for testing.

        "! Validates replacing text in a given string works fine.
        methods replace for testing.

        "! Validates strings are correctly quoted.
        methods string_to_quoted_message for testing.

endclass.
class tests_cl_utils implementation.
    method is_pointer.
        data obj type ref to casdk_cl_object.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_pointer( obj )
            msg = 'CASE 1: The given object is not a pointer'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_utils=>is_pointer( 'Not a pointer' )
            msg = 'CASE 2: The given object shoud not be a pointer'
        ).
    endmethod.

    method is_null_pointer.
        data obj type ref to casdk_cl_object.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_null_pointer( obj )
            msg = 'CASE 1: The given object is not a null pointer'
        ).

        obj = new casdk_cl_object(  ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_utils=>is_null_pointer( obj )
            msg = 'CASE 2: The given object shoud not be a null pointer'
        ).
    endmethod.

    method is_string.
        data s type casdk_raw_string.
        data i type casdk_raw_integer.
        data f type casdk_raw_float.
        data l type casdk_raw_long.

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_string( s )
            msg = 'CASE 1: The given object is not a string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_string( 'string literal' )
            msg = 'CASE 2: The given object is not a string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_utils=>is_string( i )
            msg = 'CASE 3: The given object should not be a string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_utils=>is_string( f )
            msg = 'CASE 4: The given object should not be a string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_utils=>is_string( l )
            msg = 'CASE 5: The given object should not be a string type'
        ).
    endmethod.

    method is_numeric.
        data s type casdk_raw_string.
        data i type casdk_raw_integer.
        data f type casdk_raw_float.
        data l type casdk_raw_long.

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_numeric( 1234 )
            msg = 'CASE 1: The given object is not a numeric type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_numeric( i )
            msg = 'CASE 2: The given object is not a numeric type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_numeric( f )
            msg = 'CASE 3: The given object is not a numeric type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_utils=>is_numeric( l )
            msg = 'CASE 4: The given object is not a numeric type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_utils=>is_numeric( s )
            msg = 'CASE 5: The given object should not be a numeric type'
        ).
    endmethod.

    method replace.
        cl_aunit_assert=>assert_equals(
            exp = 'x b c d x'
            act = casdk_cl_utils=>replace(
                input_str = 'a b c d a'
                text = 'a'
                new_text = 'x'
            )
            msg = 'CASE 1: The replace does not match the expected result'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 'x b c d a'
            act = casdk_cl_utils=>replace(
                input_str = 'a b c d a'
                text = 'a'
                new_text = 'x'
                times = 1
            )
            msg = 'CASE 2: The replace does not match the expected result'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 'x x x a b'
            act = casdk_cl_utils=>replace(
                input_str = 'a a a a b'
                text = 'a'
                new_text = 'x'
                times = 3
            )
            msg = 'CASE 3: The replace does not match the expected result'
        ).
    endmethod.

    method string_to_quoted_message.
        cl_aunit_assert=>assert_equals(
            exp = '«123456789123456789123456789123456789123456789»'
            act = casdk_cl_utils=>string_to_quoted_message( '123456789123456789123456789123456789123456789' )
            msg = 'CASE 1: The string is not correctly quoted'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '«123456789123456789123456789123456789123456789...»'
            act = casdk_cl_utils=>string_to_quoted_message( '123456789123456789123456789123456789123456789abcdef' )
            msg = 'CASE 2: The string is not correctly quoted'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '«»'
            act = casdk_cl_utils=>string_to_quoted_message( '' )
            msg = 'CASE 3: The string is not correctly quoted'
        ).
    endmethod.
endclass.