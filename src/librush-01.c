#include <string.h>
#include "librush-01.h"

size_t	ft_strlen(char *str)
{
	size_t i;

	i = 0;
	while (str[i])
		i += 1;
	return (i);
}

int square(int i) {
	return i * i;
}
