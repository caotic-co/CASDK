*--------------------------------------------------------------*
* Test z_2_test_object                                         *
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

"! Test for casdk_cl_object
report z_2_test_object.

include: z_casdk_definition, z_casdk_implementation.

class lcl_classname definition inheriting from casdk_cl_object. endclass.
class lcl_hash_code1 definition inheriting from casdk_cl_object. endclass.
class lcl_hash_code2 definition inheriting from casdk_cl_object. endclass.
class lcl_to_string definition inheriting from casdk_cl_object. endclass.
class lcl_abap_object definition inheriting from object. endclass.

class tests_cl_object definition for testing duration short risk level harmless.
  public section.

    "! Validates the class_name is correct.
    methods class_name for testing.

    "! Validates the hash_code is correct and corresponds to the increase in objects count.
    methods hash_code for testing.

    "! Validates two objects are the same.
    methods equals for testing.

   "! Validates the string generated for the object.
    methods to_string for testing.

    "! Validates if a given object is a casdk_cl_object.
    methods is_object for testing.
endclass.
class tests_cl_object implementation.
    method class_name.
        data obj type ref to casdk_cl_object.
        obj = new casdk_cl_object(  ).

        if not ( obj->class_name(  ) = 'CASDK_CL_OBJECT' ).
            cl_aunit_assert=>fail(
                msg = 'CASE 1: The class name is incorrect'
            ).
        endif.

        cl_aunit_assert=>assert_differs(
            exp = ''
            act = obj->class_name(  )
            msg = 'CASE 2: The class name is empty'
        ).

        obj = new lcl_classname(  ).
        if not ( obj->class_name(  ) = 'LCL_CLASSNAME'  ).
            cl_aunit_assert=>fail(
                msg = 'CASE 3: The class name is incorrect'
            ).
        endif.

        cl_aunit_assert=>assert_differs(
            exp = ''
            act = obj->class_name(  )
            msg = 'CASE 4: The class name is empty'
        ).
    endmethod.

    method equals.
        data obj1 type ref to casdk_cl_object.
        data obj2 type ref to casdk_cl_object.

        obj1 = new casdk_cl_object(  ).
        obj2 = obj1.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = obj1->equals( obj2 )
            msg = 'CASE 1: obj1 and obj2 should equal'
        ).

        obj1 = new casdk_cl_object(  ).
        obj2 = new casdk_cl_object(  ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = obj1->equals( obj2 )
            msg = 'CASE 2: obj1 and obj2 should not be equal'
        ).

        obj1 = new casdk_cl_object(  ).
        clear obj2.
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = obj1->equals( obj2 )
            msg = 'CASE 3: obj1 and obj2 should not be equal'
        ).

    endmethod.


    method hash_code.
        data obj1 type ref to casdk_cl_object.
        data obj2 type ref to casdk_cl_object.

        obj1 = new lcl_hash_code1(  ).
        obj2 = new lcl_hash_code2(  ).

        cl_aunit_assert=>assert_equals(
            exp = 0
            act = obj1->hash_code(  )
            msg = 'CASE 1.1: The hashcode fore the first lcl_hash_code1 instance should be 0'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 0
            act = obj2->hash_code(  )
            msg = 'CASE 1.2: The hashcode fore the first lcl_hash_code2 instance should be 0'
        ).


        obj1 = new lcl_hash_code1(  ).
        obj2 = new lcl_hash_code2(  ).

        cl_aunit_assert=>assert_equals(
            exp = 1
            act = obj1->hash_code(  )
            msg = 'CASE 2.1: The hashcode fore the second lcl_hash_code1 instance should be 1'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 1
            act = obj2->hash_code(  )
            msg = 'CASE 2.2: The hashcode fore the second lcl_hash_code2 instance should be 1'
        ).

        obj2 = new lcl_hash_code2(  ).

        cl_aunit_assert=>assert_equals(
            exp = 1
            act = obj1->hash_code(  )
            msg = 'CASE 3.1: The hashcode fore the second lcl_hash_code1 instance should be 1'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 2
            act = obj2->hash_code(  )
            msg = 'CASE 3.2: The hashcode fore the second lcl_hash_code2 instance should be 2'
        ).
    endmethod.

    method to_string.
        data obj type ref to casdk_cl_object.
        obj = new lcl_to_string(  ).
        if not ( obj->to_string(  ) = 'LCL_TO_STRING@0'  ).
            cl_aunit_assert=>fail(
                msg = 'CASE 1: The object id does not match'
            ).
        endif.

        obj = new lcl_to_string(  ).
        if not ( obj->to_string(  ) = 'LCL_TO_STRING@1'  ).
            cl_aunit_assert=>fail(
                msg = 'CASE 2: The object id does not match'
            ).
        endif.
    endmethod.

    method is_object.
        data(casdK_obj) = new casdk_cl_object(  ).
        data(abap_obj) = new lcl_abap_object(  ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_cl_object=>is_object( obj = casdK_obj )
            msg = 'CASE 1: casdK_obj should be a casdk_cl_object'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_cl_object=>is_object( obj = abap_obj )
            msg = 'CASE 2: abap_obj should not be a casdk_cl_object'
        ).
    endmethod.
endclass.