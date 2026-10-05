#include <stdint.h>

int find_element(int64_t *ptr, int64_t pos, int64_t val) {
    // ptr points to an array of 64-bit integers
    // pos is the array index
    // val is the value to compare against

    // Access the element at position pos
    int64_t element = *(ptr + pos);

    // Return 1 if the element equals val, otherwise return 0
    return (element == val ? 1 : 0);
}
