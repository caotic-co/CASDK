*--------------------------------------------------------------*
* Test z_1_test_exceptions                                     *
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

"! Test for the casdk exceptions
report z_1_test_exceptions.

include: z_casdk_definition, z_casdk_implementation.

class exceptions_tests definition for testing duration short risk level harmless.
  public section.
    "! Validates the behavior of the casdk_exception class.
    methods test_exception for testing.

    "! Validates the behavior of the casdk_runtime_exception class.
    methods test_runtime_exception for testing.

    "! Validates the behavior of the casdk_nullpointer_exception class.
    methods test_nullpointer_exception for testing.

    "! Validates the behavior of the casdk_cast_exception class.
    methods test_cast_exception for testing.

    "! Validates the behavior of the casdk_invalid_type_exception class.
    methods test_invalid_type_exception for testing.

    "! Validates the behavior of the casdk_overflow_exception
    methods test_overflow_exception for testing.

    "! Validates the behavior of the casdk_index_out_of_bounds_ex
    methods test_index_out_of_bounds_ex for testing.

endclass.
class exceptions_tests implementation.
    method test_exception.
        try.
            new casdk_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_exception"' ).
            endif.
            data(cast_ex) = cast casdk_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.

        cl_aunit_assert=>assert_equals(
            exp = '«123456789123456789123456789123456789123456789»'
            act = casdk_exception=>string_to_quoted_cx_message( '123456789123456789123456789123456789123456789' )
            msg = 'CASE 2: The string is not correctly quoted'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '«123456789123456789123456789123456789123456789...»'
            act = casdk_exception=>string_to_quoted_cx_message( '123456789123456789123456789123456789123456789abcdef' )
            msg = 'CASE 3: The string is not correctly quoted'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '«»'
            act = casdk_exception=>string_to_quoted_cx_message( '' )
            msg = 'CASE 4: The string is not correctly quoted'
        ).
    endmethod.

    method test_runtime_exception.
        try.
            new casdk_runtime_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_runtime_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_runtime_exception"' ).
            endif.
            data(cast_ex) = cast casdk_runtime_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_nullpointer_exception.
        try.
            new casdk_nullpointer_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_nullpointer_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_nullpointer_exception"' ).
            endif.
            data(cast_ex) = cast casdk_nullpointer_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cast_exception.
        try.
            new casdk_cast_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cast_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cast_exception"' ).
            endif.
            data(cast_ex) = cast casdk_cast_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_invalid_type_exception.
        try.
            new casdk_invalid_type_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_invalid_type_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_invalid_type_exception"' ).
            endif.
            data(cast_ex) = cast casdk_invalid_type_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_overflow_exception.
        try.
            new casdk_overflow_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_overflow_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_overflow_exception"' ).
            endif.
            data(cast_ex) = cast casdk_overflow_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_index_out_of_bounds_ex.
        try.
            new casdk_index_out_of_bounds_ex(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_index_out_of_bounds_ex.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_index_out_of_bounds_ex"' ).
            endif.
            data(cast_ex) = cast casdk_index_out_of_bounds_ex( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.
endclass.