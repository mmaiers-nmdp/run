# -*- coding: utf-8 -*-

#
#    run RUN.
#    Copyright (c) 2018 Be The Match operated by National Marrow Donor Program. All Rights Reserved.
#
#    This library is free software; you can redistribute it and/or modify it
#    under the terms of the GNU Lesser General Public License as published
#    by the Free Software Foundation; either version 3 of the License, or (at
#    your option) any later version.
#
#    This library is distributed in the hope that it will be useful, but WITHOUT
#    ANY WARRANTY; with out even the implied warranty of MERCHANTABILITY or
#    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
#    License for more details.
#
#    You should have received a copy of the GNU Lesser General Public License
#    along with this library;  if not, write to the Free Software Foundation,
#    Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA.
#
#    > http://www.fsf.org/licensing/licenses/lgpl.html
#    > http://www.opensource.org/licenses/lgpl-license.php
#

import argparse

# Instantiate the parser
parser = argparse.ArgumentParser(description='preprocessing HLA')

# Required positional argument
parser.add_argument('input_file', type=argparse.FileType('r'),
                    help='input file')
parser.add_argument('output_file', type=argparse.FileType('w'),
                    help='output file')

# Optional argument
parser.add_argument('--hladb_version', type=int,
                    help='HLADB version 3.31.0 would be 3310')

args = parser.parse_args()

print("Preprocessing:")
print(args.input_file)
print(args.output_file)
print(args.hladb_version)

