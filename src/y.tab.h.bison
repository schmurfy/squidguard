/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     WORD = 258,
     END = 259,
     START_BRACKET = 260,
     STOP_BRACKET = 261,
     WEEKDAY = 262,
     LDAPDNSTR = 263,
     DESTINATION = 264,
     REWRITE = 265,
     ACL = 266,
     TIME = 267,
     TVAL = 268,
     DVAL = 269,
     DVALCRON = 270,
     SOURCE = 271,
     CIDR = 272,
     IPCLASS = 273,
     CONTINUE = 274,
     IPADDR = 275,
     DBHOME = 276,
     DOMAINLIST = 277,
     URLLIST = 278,
     EXPRESSIONLIST = 279,
     IPLIST = 280,
     DOMAIN = 281,
     USER = 282,
     USERLIST = 283,
     USERQUERY = 284,
     LDAPUSERSEARCH = 285,
     USERQUOTA = 286,
     IP = 287,
     PORT_NUMBER = 288,
     PORT = 289,
     NL = 290,
     NUMBER = 291,
     PASS = 292,
     REDIRECT = 293,
     LOGDIR = 294,
     SUBST = 295,
     CHAR = 296,
     MINUTELY = 297,
     HOURLY = 298,
     DAILY = 299,
     WEEKLY = 300,
     DATE = 301,
     WITHIN = 302,
     OUTSIDE = 303,
     ELSE = 304,
     LOGFILE = 305,
     ANONYMOUS = 306,
     VERBOSE = 307,
     CONTINIOUS = 308,
     SPORADIC = 309,
     LDAPCACHETIME = 310,
     EXECUSERLIST = 311,
     EXECCMD = 312,
     LDAPPROTOVER = 313,
     LDAPBINDDN = 314,
     LDAPBINDPASS = 315,
     MYSQLUSERNAME = 316,
     MYSQLPASSWORD = 317,
     DATABASE = 318
   };
#endif
/* Tokens.  */
#define WORD 258
#define END 259
#define START_BRACKET 260
#define STOP_BRACKET 261
#define WEEKDAY 262
#define LDAPDNSTR 263
#define DESTINATION 264
#define REWRITE 265
#define ACL 266
#define TIME 267
#define TVAL 268
#define DVAL 269
#define DVALCRON 270
#define SOURCE 271
#define CIDR 272
#define IPCLASS 273
#define CONTINUE 274
#define IPADDR 275
#define DBHOME 276
#define DOMAINLIST 277
#define URLLIST 278
#define EXPRESSIONLIST 279
#define IPLIST 280
#define DOMAIN 281
#define USER 282
#define USERLIST 283
#define USERQUERY 284
#define LDAPUSERSEARCH 285
#define USERQUOTA 286
#define IP 287
#define PORT_NUMBER 288
#define PORT 289
#define NL 290
#define NUMBER 291
#define PASS 292
#define REDIRECT 293
#define LOGDIR 294
#define SUBST 295
#define CHAR 296
#define MINUTELY 297
#define HOURLY 298
#define DAILY 299
#define WEEKLY 300
#define DATE 301
#define WITHIN 302
#define OUTSIDE 303
#define ELSE 304
#define LOGFILE 305
#define ANONYMOUS 306
#define VERBOSE 307
#define CONTINIOUS 308
#define SPORADIC 309
#define LDAPCACHETIME 310
#define EXECUSERLIST 311
#define EXECCMD 312
#define LDAPPROTOVER 313
#define LDAPBINDDN 314
#define LDAPBINDPASS 315
#define MYSQLUSERNAME 316
#define MYSQLPASSWORD 317
#define DATABASE 318




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 83 "sg.y"
{
  char *string;
  char *tval;
  char *dval;
  char *dvalcron;
  int  *integer;
}
/* Line 1529 of yacc.c.  */
#line 183 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

