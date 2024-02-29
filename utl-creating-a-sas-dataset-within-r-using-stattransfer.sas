%let pgm=utl-creating-a-sas-dataset-within-r-using-stattransfer;

Creating a sas dataset within r using stattransfer

github
http://tinyurl.com/yzaymb8p
https://github.com/rogerjdeangelis/utl-creating-a-sas-dataset-within-r-using-stattransfer

R function on end

SOAPBOX ON
Although circle systems says that the free version is identical to the paid version, except the free
vesion limits observations, it is not. You need a paid version call stattransfer
from R,
I took me an entire day and many emails to make find that out.
SOAPBOX OFF

Requirements

No haggling needed WYSIWYG (prices are online - refreshing)

https://stattransfer.com/ordering/prices/

$249 per year  Business                 Single-User Subscription (Includes upgrades during term)
$249 per year  Gov Research Non Profit  Single-User Subscription (Includes upgrades during term)
$179 per year  Academic                 Single-User Subscription (includes upgrades during term)
$99  per year  Student                  Single-User Subscription (includes upgrades during term)

c:/temp directory (holding off on temp directories, very beta code)

Program flow
    1. save R dataframe as an rds file
    2. create stattransfer script c:/temp/cmds.stcmd
    3. shell out and execute the script

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                |                                |                                                      */
/*                 INPUT          |        PROCESS                 |              OUTPUT(SAS DAATSET                      */
/* > iris;                        |                                |                                                      */
/*     Sepal  Sepal  Petal  Petal |  %utl_submit_r64x('            | TMP.IRIS total obs=150 28FEB2024:15:23:26            */
/*     Length Width  Length Width |  source("c:/temp/fn_tosas9.R");|                                                      */
/*                                |  fn_tosas9(dataf=iris);        |          SEPAL_ SEPAL_ PETAL_ PETAL_                 */
/* 1     5.1    3.5    1.4   0.2  |  ');                           | ROWNAMES LENGTH  WIDTH LENGTH  WIDTH                 */
/* 2     4.9    3.0    1.4   0.2  |                                |                                                      */
/* 3     4.7    3.2    1.3   0.2  |  libname tmp "c:/temp";        |     1      5.1    3.5    1.4    0.2                  */
/* 4     4.6    3.1    1.5   0.2  |  proc print data=tmp.iris;     |     2      4.9    3.0    1.4    0.2                  */
/* 5     5.0    3.6    1.4   0.2  |  run;quit;                     |     3      4.7    3.2    1.3    0.2                  */
/* 6     5.4    3.9    1.7   0.4  |                                |     4      4.6    3.1    1.5    0.2                  */
/* 7     4.6    3.4    1.4   0.3  |                                |     5      5.0    3.6    1.4    0.2                  */
/* 8     5.0    3.4    1.5   0.2  |                                |     6      5.4    3.9    1.7    0.4                  */
/*                                                                 |                                                      */
/**************************************************************************************************************************/

/*                                    ___     _                   _
 _ __  _ __ ___   ___ ___  ___ ___   ( _ )   (_)_ __  _ __  _   _| |_
| `_ \| `__/ _ \ / __/ _ \/ __/ __|  / _ \/\ | | `_ \| `_ \| | | | __|
| |_) | | | (_) | (_|  __/\__ \__ \ | (_>  < | | | | | |_) | |_| | |_
| .__/|_|  \___/ \___\___||___/___/  \___/\/ |_|_| |_| .__/ \__,_|\__|
|_|                                                  |_|
*/

%utl_submit_r64x('
source("c:/temp/fn_tosas9.R");
fn_tosas9(dataf=iris);
');

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Stderr output:                                                                                                         */
/* Stat/Transfer - Command Processor (c) 1986-2024 Circle Systems, Inc.                                                   */
/* www.stattransfer.com                                                                                                   */
/* Version 16.4.1664.0209 - 64 Bit Windows (10.0.19041)                                                                   */
/*                                                                                                                        */
/* User:	Roger DeAngelis - CompuCraf                                                                                      */
/* License Type:	Single User Commercial Subscriptio                                                                       */
/* Status:	License OK - Expires March 1, 202                                                                              */
/* Transferring from R Single object: C:/temp/rdsdat.rds                                                                  */
/* Input file has 6 variables                                                                                             */
/* Optimization has been enabled by the user.                                                                             */
/* Optimizing (All records) ...                                                                                           */
/*                                                                                                                        */
/* Transferring to SAS Data File - Version Nine: C:/temp/iris.sas7bdat                                                    */
/*                                                                                                                        */
/* 150 cases were transferred(0.00 seconds)                                                                               */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

libname tmp "c:/temp";
proc print data=tmp.iris;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  c:/temp/iris.sas7bdat                                                                                                 */
/*                                                                                                                        */
/*                                                                                                                        */
/*                     SEPAL_    SEPAL_    PETAL_    PETAL_                                                               */
/*  Obs    ROWNAMES    LENGTH     WIDTH    LENGTH     WIDTH    SPECIES                                                    */
/*                                                                                                                        */
/*    1        1         5.1       3.5       1.4       0.2        1                                                       */
/*    2        2         4.9       3.0       1.4       0.2        1                                                       */
/*    3        3         4.7       3.2       1.3       0.2        1                                                       */
/*    4        4         4.6       3.1       1.5       0.2        1                                                       */
/*    5        5         5.0       3.6       1.4       0.2        1                                                       */
/*    6        6         5.4       3.9       1.7       0.4        1                                                       */
/*    7        7         4.6       3.4       1.4       0.3        1                                                       */
/*    8        8         5.0       3.4       1.5       0.2        1                                                       */
/*    9        9         4.4       2.9       1.4       0.2        1                                                       */
/*   10       10         4.9       3.1       1.5       0.1        1                                                       */
/*   11       11         5.4       3.7       1.5       0.2        1                                                       */
/*   12       12         4.8       3.4       1.6       0.2        1                                                       */
/*   ...                                                                                                                  */
/*  44       144         6.8       3.2       5.9       2.3        3                                                       */
/*  45       145         6.7       3.3       5.7       2.5        3                                                       */
/*  46       146         6.7       3.0       5.2       2.3        3                                                       */
/*  47       147         6.3       2.5       5.0       1.9        3                                                       */
/*  48       148         6.5       3.0       5.2       2.0        3                                                       */
/*  49       149         6.2       3.4       5.4       2.3        3                                                       */
/*  50       150         5.9       3.0       5.1       1.8        3                                                       */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*       __                  _   _
 _ __   / _|_   _ _ __   ___| |_(_) ___  _ __
| `__| | |_| | | | `_ \ / __| __| |/ _ \| `_ \
| |    |  _| |_| | | | | (__| |_| | (_) | | | |
|_|    |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|

*/

filename ft15f001 "c:/temp/fn_tosas9.R";
parmcards4;
   fn_tosas9<-function(dataf=NULL) {
   dfstr<-deparse(substitute(dataf));
   file.remove(paste0("c:\\temp\\",dfstr,".sas7bdat"));
   file.remove("c:\\temp\\cmds.stcmd");
   saveRDS(dataf, file="c:/temp/rdsdat.rds");
   fileConn<-file("c:/temp/comands.txt");
   writeLines(c(
    "set numeric-names      n              "
   ,"set log-level          e              "
   ,"set in-encoding        system         "
   ,"set out-encoding       system         "
   ,"set enc-errors         sub            "
   ,"set enc-sub-char       _              "
   ,"set enc-error-limit    100            "
   ,"set var-case-ci        preserve-always"
   ,"set preserve-str-widths n             "
   ,"set preserve-num-widths n             "
   ,"set recs-to-optimize   all            "
   ,"set factor-as-string   n              "
   ,"set sas-date-fmt       mmddyy         "
   ,"set sas-time-fmt       time           "
   ,"set sas-datetime-fmt   datetime       "
   ,"set write-file-label   none           "
   ,"set write-sas-fmts     n              "
   ,"set sas-outrep         windows_64     "
   ,"set write-old-ver      18             "
   ,"copy  C:/temp/rdsdat.rds sas9 C:/temp/chileancredit.sas7bdat -T<chileancredit"),fileConn);
    writeLines( "c:/temp/comands.txt");
    close(fileConn);
   file.show("c:/temp/comands.txt");
   lines <- readLines("c:/temp/commands.stcmd");
   for (line in lines) {
     modified_line <- sub(pattern = "chileancredit", replace = dfstr, x = line);
     modified_line <- sub(pattern = "chileancredit", replace = dfstr, x = modified_line);
     print(modified_line);
     write(modified_line, file = "c:/temp/cmds.stcmd", append = TRUE);
   };
   system(paste("c:\\PROGRA~1\\StatTransfer16-64\\st.exe",
     "c:/temp/cmds.stcmd"), wait = FALSE);
   quit(save="no");
    };

;;;;
run;quit;


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
