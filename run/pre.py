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
##############################################################################


import argparse

# Instantiate the parser
parser = argparse.ArgumentParser(description='preprocessing HLA')

# Required positional argument
parser.add_argument('input_file', type=argparse.FileType('r'),
                    help='input file')

# Optional argument
parser.add_argument('--hladb_version', type=int,
                    help='HLADB version 3.31.0 would be 3310')

# parse args
args = parser.parse_args()
infile = args.input_file.name
hladb = args.hladb_version

# set up ARD
# TODO set a default hladb
from pyard import ARD
ard = ARD(str(hladb))

import re
def doloc(loc, t1, t2): 
    
    # trim extraneous whitespace
    t1 = t1.strip()
    t2 = t2.strip()

    # explicit homozygous
    if not re.search("[0-9][0-9]", t2):
        t2 = t1
    if not re.search("[0-9][0-9]", t1):
        t1 = t2

    # must have a colon
    if not re.search(":", t1):
        return t1, t2
    if not re.search(":", t2):
        return t1, t2

    # make into loc*allele
    if not re.search("\*", t1):
        t1 = "*".join([loc, t1])
    if not re.search("\*", t2):
        t2 = "*".join([loc, t2])
       
    # trim G
    m = re.search("(.*[0-9])[PG]", t1) 
    if m:
        t1 = m.group(1)
       
    m = re.search("(.*[0-9])[PG]", t2) 
    if m:
        t2 = m.group(1)

    # trim shorthand like 07:04/11
    m = re.search("(.*)\/", t1) 
    if m:
        t1 = m.group(1)
    m = re.search("(.*)\/", t2) 
    if m:
        t2 = m.group(1)
      
    
    r1 = ard.redux_gl(t1, 'lgx')
    r2 = ard.redux_gl(t2, 'lgx')
    return r1, r2
    #gl = "+".join([t1, t2])
    #return ard.redux_gl(gl, 'lgx')


# parse input file
import csv
ifd = open(infile, "r")
reader = csv.reader(ifd)


for row in reader:
    if (row[0] == "ION"):
        header = row
    else:
        ion = row[0]
        id  = row[1]
        iid = ion + id
        a1= row[11] 
        a2= row[12]
        b1= row[13] 
        b2= row[14]
        c1= row[15] 
        c2= row[16]
        drb1_2= row[17]
        drb1_1= row[18] 

        (na1, na2) = doloc("A", a1, a2)
        print (','.join([iid, "A", a1, a2, na1, na2]))

        (nb1, nb2) = doloc("B", b1, b2)
        print (','.join([iid, "B", b1, b2, nb1, nb2]))

        (nc1, nc2) = doloc("C", c1, c2)
        print (','.join([iid, "C", c1, c2, nc1, nc2]))

        (ndrb1_1, ndrb1_b2) = doloc("DRB1", drb1_1, drb1_2)
        print (','.join([iid, "DRB1", drb1_1, drb1_2, ndrb1_1, ndrb1_b2]))


ifd.close()  # close the file




