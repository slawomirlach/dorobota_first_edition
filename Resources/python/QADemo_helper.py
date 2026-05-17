
from robot.api import logger

def text_box_verify_output(output, full_name, email, current_address, permanent_address):
    """
    Verifies the output of a text box against the expected values.

    *Args:*
        | name | type | description |
        | output | (str) | The actual output from the text box. |
        | full_name | (str) | The expected full name. |
        | email | (str) | The expected email. |
        | current_address | (str) | The expected current address. |
        | permanent_address | (str) | The expected permanent address. |

    Raises:
        AssertionError: If any of the expected values are not found in the output.
    """

    logger.info(f"Verifying text box output: {output}")
    logger.info(f"Expected full name: {full_name}")
    logger.info(f"Expected email: {email}")
    logger.info(f"Expected current address: {current_address}")
    logger.info(f"Expected permanent address: {permanent_address}")

    print(f"Verifying text box output: {output}")
    print(f"Expected full name: {full_name}")
    print(f"Expected email: {email}")

    
    if full_name not in output:
        raise AssertionError(f"Expected full name '{full_name}' not found in output: {output}")
    if email not in output:
        raise AssertionError(f"Expected email '{email}' not found in output: {output}")
    if current_address not in output:
        raise AssertionError(f"Expected current address '{current_address}' not found in output: {output}")
    if permanent_address not in output:
        raise AssertionError(f"Expected permanent address '{permanent_address}' not found in output: {output}")
