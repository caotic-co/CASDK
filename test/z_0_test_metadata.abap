*--------------------------------------------------------------*
* Test z_0_test_metadata                                        *
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

"! Tests for casdk_cl_metadata
report z_0_test_metadata.

include: z_casdk_definition, z_casdk_implementation.

class tests_cl_metadata definition for testing duration short risk level harmless.
    public section.
        "! Validates the full version is correctly generated
        methods full_version for testing.

        "! Validates the major version is correctly generated
        methods major_version for testing.

        "! Validates the minor version is correctly generated
        methods minor_version for testing.

        "! Validates the patch version is correctly generated
        methods patch_version for testing.

endclass.
class tests_cl_metadata implementation.
    method full_version.
        cl_aunit_assert=>assert_equals(
            exp = '1.0.0'
            act = casdk_cl_metadata=>full_version(  )
            msg = 'CASE 1: The generated version does not match the expected one'
        ).
    endmethod.

    method major_version.
        cl_aunit_assert=>assert_equals(
            exp = 1
            act = casdk_cl_metadata=>major_version(  )
            msg = 'CASE 1: The generated major version does not match the expected one'
        ).
    endmethod.

    method minor_version.
        cl_aunit_assert=>assert_equals(
            exp = 0
            act = casdk_cl_metadata=>minor_version(  )
            msg = 'CASE 1: The generated minor version does not match the expected one'
        ).
    endmethod.

    method patch_version.
        cl_aunit_assert=>assert_equals(
            exp = 0
            act = casdk_cl_metadata=>patch_version(  )
            msg = 'CASE 1: The generated patch version does not match the expected one'
        ).
    endmethod.
endclass.