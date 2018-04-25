cmake_minimum_required(VERSION 3.5)
project (hello)

# Create py/hello.py using custom command
add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/py/hello.py
    COMMENT "Copying hello.py"
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/py
    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_SOURCE_DIR}/py/hello.py ${CMAKE_BINARY_DIR}/py
)

# Without add_custom_command, "no rule to make target py/hello.py" error occurs
add_custom_target(hello_py ALL DEPENDS ${CMAKE_BINARY_DIR}/py/hello.py
    COMMENT "Update hello_py.txt" whenever make is called
    COMMAND ${CMAKE_COMMAND} -E touch ${CMAKE_BINARY_DIR}/py/hello_py.txt
)
