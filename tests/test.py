import unittest
import subprocess

from ctypes import *

lib = "/Users/timlecou/Documents/projects_42/github/c_piscine_rush01/project/librush01.dylib"
rush01 = CDLL(lib)


class   TestRush01(unittest.TestCase):

    def test_ft_strlen(self):
        self.assertEqual(4, rush01.ft_strlen(b"toto"))

    def test_ft_strlen_with_null(self):
        self.assertEqual(0, rush01.ft_strlen(b""))

    def test_launch_program_with_no_argument(self):
        subprocess.run(["rush-01"], stdout=subprocess.PIPE)

unittest.main()