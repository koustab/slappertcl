#########################################################
# 		[ ON JOIN SLAPPER 1.0]			#
#-------------------------------------------------------#
# what this script does: 			        #
# any one who joins the channel get a slap on join	#
#							#
# Installation : just place the tcl and file in your 	#
# script directory. add it to you eggdrop conf file.    #
# you are good to go					#
#_______________________________________________________# 	
#                                        --by Error 	#
#=======================================================#
#          web: https://anoddprojec.co.uk		#
#            contact : error@oddprotocol.org	        #
#	        irc: irc.oddprotocol.org	        #
#		 channel :  #Error	                #
#							#
#########################################################


#########type your test here#############################

# put the channel names here where this script will act. #
# multi channel is not working yet. 			 #

set chname  "#test"

# put the complete path for the text file where all the  #
# action texts are. ;)                                   #

set txtfile "scripts/helper/slap.txt"


########## Dont need to touch bellow ####################


bind join - * slapper:wjoin

proc slapper:wjoin {nick host handle chan} {
global chname txtfile
      set room $chname
      set slaptxt [open $txtfile r]
      set readvar [split [read $slaptxt] \n]
      close $slaptxt

if {(([lsearch -exact [string tolower $room] [string tolower $chan]] != -1)  || ($room == "*"))} {
  puthelp "PRIVMSG $room :\001ACTION slaps $nick [lindex $readvar [rand [llength $readvar]]]"
  }
 
}

putlog "slapper.tcl 1.0 by \002 Error Loaded"
