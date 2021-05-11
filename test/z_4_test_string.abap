*--------------------------------------------------------------*
* Test z_4_test_string                                        *
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

"! Tests for casdk_string
report z_4_test_string.

include: z_casdk_definition, z_casdk_implementation.

class string_tests definition for testing duration short risk level harmless.
    public section.
        "! Validates references are correctly evaluated
        methods is_a_valid_raw_value for testing.

        "! Validates replacing text in a given string works fine.
        methods replace for testing.

        "! Validates the creation of objects matches the assigned raw boolean value.
        methods value_of_get_value for testing.
endclass.

class string_tests implementation.
     method is_a_valid_raw_value.
        data s type casdk_raw_string.
        data i type casdk_raw_integer.
        data f type casdk_raw_float.
        data l type casdk_raw_long.

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_string=>is_a_valid_raw_value( s )
            msg = 'CASE 1: The given element is not a valid raw string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_string=>is_a_valid_raw_value( 'string literal' )
            msg = 'CASE 2: The given element is not a valid raw string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_string=>is_a_valid_raw_value( i )
            msg = 'CASE 3: The given element should not be a valid raw string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_string=>is_a_valid_raw_value( f )
            msg = 'CASE 4: The given element should not be a valid raw string type'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_string=>is_a_valid_raw_value( l )
            msg = 'CASE 5: The given element should not be a valid raw string type'
        ).
    endmethod.

    method replace.
        cl_aunit_assert=>assert_equals(
            exp = 'x b c d x'
            act = casdk_string=>value_of( 'a b c d a' )->replace(
                text = 'a'
                new_text = 'x'
            )->get_value(  )
            msg = 'CASE 1: The replace does not match the expected result'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 'x b c d a'
            act = casdk_string=>value_of( 'a b c d a' )->replace(
                text = 'a'
                new_text = 'x'
                times = 1
            )->get_value(  )
            msg = 'CASE 2: The replace does not match the expected result'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 'x x x a b'
            act = casdk_string=>value_of( 'a a a a b' )->replace(
                text = 'a'
                new_text = 'x'
                times = 3
            )->get_value(  )
            msg = 'CASE 3: The replace does not match the expected result'
        ).
    endmethod.

    method value_of_get_value.
        cl_aunit_assert=>assert_equals(
            exp = 'ABC'
            act = casdk_string=>value_of( 'ABC' )->get_value(  )
            msg = 'CASE 1: The obtained string does not match the expected result'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '123'
            act = casdk_string=>value_of( 123 )->get_value(  )
            msg = 'CASE 2: The obtained string does not match the expected result'
        ).

        try.
            data empty_object type ref to casdk_object.
            casdk_string=>value_of( empty_object ).
            cl_aunit_assert=>fail(
                msg = 'CASE 3: A casdk_nullpointer_exception should have been raised'
            ).
        catch casdk_nullpointer_exception into data(ne).
            " Do Nothing
        endtry.

        try.
            data(any_object) = new casdk_object(  ).
            casdk_string=>value_of( any_object ).
            cl_aunit_assert=>fail(
                msg = 'CASE 4: A casdk_cast_exception should have been raised'
            ).
        catch casdk_cast_exception into data(ce).
            " Do Nothing
        endtry.
    endmethod.
endclass.