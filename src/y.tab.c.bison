/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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




/* Copy the first part of user declarations.  */
#line 20 "sg.y"

#include "sg.h"
extern int globalDebug;

#ifdef HAVE_LIBLDAP
#ifndef LDAP_DEPRECATED
#define LDAP_DEPRECATED 1
#endif
#include <lber.h>
#include <ldap.h>
#endif

#ifdef HAVE_MYSQL
#include <mysql.h>
#endif

#include "sgEx.h"

FILE *yyin, *yyout;
char *configFile;

int numTimeElements;
int *TimeElementsEvents;

static int time_switch = 0;
static int date_switch = 0;

int numSource = 0;

void rfc1738_unescape(char *);
void
rfc1738_unescape(char *s)
{
    char hexnum[3];
    int i, j;                   /* i is write, j is read */
    unsigned int x;
    for (i = j = 0; s[j]; i++, j++) {
        s[i] = s[j];
        if (s[i] != '%')
            continue;
        if (s[j + 1] == '%') {  /* %% case */
            j++;
            continue;
        }
        if (s[j + 1] && s[j + 2]) {
            if (s[j + 1] == '0' && s[j + 2] == '0') {   /* %00 case */
                j += 2;
                continue;
            }
            hexnum[0] = s[j + 1];
            hexnum[1] = s[j + 2];
            hexnum[2] = '\0';
            if (1 == sscanf(hexnum, "%x", &x)) {
                s[i] = (char) (0x0ff & x);
                j += 2;
            }
        }
    }
    s[i] = '\0';
}



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

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
/* Line 193 of yacc.c.  */
#line 293 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 306 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   190

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  68
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  56
/* YYNRULES -- Number of rules.  */
#define YYNRULES  148
/* YYNRULES -- Number of states.  */
#define YYNSTATES  230

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   318

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    67,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    66,    64,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,    65,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    11,    14,    17,    20,    23,
      26,    29,    32,    34,    36,    39,    44,    45,    48,    51,
      54,    57,    60,    63,    67,    70,    73,    76,    79,    82,
      86,    90,    95,   100,   103,   106,   111,   112,   115,   118,
     121,   124,   127,   132,   137,   142,   147,   150,   153,   156,
     159,   162,   166,   170,   175,   180,   183,   185,   186,   189,
     192,   193,   196,   199,   204,   205,   208,   210,   214,   218,
     223,   224,   234,   235,   238,   241,   244,   247,   251,   255,
     260,   265,   268,   269,   272,   276,   279,   281,   283,   284,
     287,   291,   295,   300,   303,   305,   308,   313,   314,   317,
     319,   322,   325,   329,   333,   338,   343,   346,   349,   354,
     355,   358,   359,   360,   366,   367,   368,   374,   375,   379,
     380,   386,   390,   393,   395,   400,   404,   407,   409,   411,
     413,   415,   416,   419,   421,   423,   425,   427,   429,   431,
     433,   435,   437,   439,   441,   443,   445,   447,   449
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      69,     0,    -1,   122,    -1,    21,     3,    -1,    39,     3,
      -1,    55,    36,    -1,    58,    36,    -1,    59,     8,    -1,
      60,     3,    -1,    61,     3,    -1,    62,     3,    -1,    63,
       3,    -1,     5,    -1,     6,    -1,     9,     3,    -1,    81,
      79,    83,    80,    -1,    -1,    83,    84,    -1,    22,     3,
      -1,    22,    64,    -1,    23,     3,    -1,    23,    64,    -1,
      24,    64,    -1,    24,    65,     3,    -1,    24,     3,    -1,
      38,     3,    -1,    10,     3,    -1,    47,     3,    -1,    48,
       3,    -1,    50,    51,     3,    -1,    50,    52,     3,    -1,
      50,    51,    52,     3,    -1,    50,    52,    51,     3,    -1,
      50,     3,    -1,    16,     3,    -1,    85,    79,    87,    80,
      -1,    -1,    87,    88,    -1,    26,    89,    -1,    27,    90,
      -1,    28,     3,    -1,    56,    57,    -1,    31,    36,    36,
      43,    -1,    31,    36,    36,    44,    -1,    31,    36,    36,
      45,    -1,    31,    36,    36,    36,    -1,    32,   101,    -1,
      34,    36,    -1,    25,     3,    -1,    47,     3,    -1,    48,
       3,    -1,    50,    51,     3,    -1,    50,    52,     3,    -1,
      50,    51,    52,     3,    -1,    50,    52,    51,     3,    -1,
      50,     3,    -1,    19,    -1,    -1,    89,     3,    -1,    89,
      66,    -1,    -1,    90,     3,    -1,    90,    66,    -1,    11,
      79,    92,    80,    -1,    -1,    92,    94,    -1,     3,    -1,
       3,    47,     3,    -1,     3,    48,     3,    -1,    93,    79,
      96,    80,    -1,    -1,    93,    79,    96,    80,    49,    95,
      79,    96,    80,    -1,    -1,    96,    97,    -1,    37,    98,
      -1,    10,     3,    -1,    38,     3,    -1,    50,    51,     3,
      -1,    50,    52,     3,    -1,    50,    51,    52,     3,    -1,
      50,    52,    51,     3,    -1,    50,     3,    -1,    -1,    98,
       3,    -1,    98,    67,     3,    -1,    98,    66,    -1,    17,
      -1,    18,    -1,    -1,   101,   102,    -1,   101,   102,    99,
      -1,   101,   102,   100,    -1,   101,   102,    64,   102,    -1,
     101,    66,    -1,    20,    -1,    10,     3,    -1,   103,    79,
     105,    80,    -1,    -1,   105,   106,    -1,    40,    -1,    47,
       3,    -1,    48,     3,    -1,    50,    51,     3,    -1,    50,
      52,     3,    -1,    50,    51,    52,     3,    -1,    50,    52,
      51,     3,    -1,    50,     3,    -1,    12,     3,    -1,   107,
      79,   109,    80,    -1,    -1,   109,   110,    -1,    -1,    -1,
      45,   111,     3,   112,   116,    -1,    -1,    -1,    45,   113,
       7,   114,   116,    -1,    -1,    46,   115,   118,    -1,    -1,
     116,   117,   120,    64,   120,    -1,   120,    64,   120,    -1,
     119,   116,    -1,   119,    -1,   119,    64,   119,   116,    -1,
     119,    64,   119,    -1,   121,   116,    -1,   121,    -1,    14,
      -1,    13,    -1,    15,    -1,    -1,   122,   123,    -1,    81,
      -1,    86,    -1,    82,    -1,    70,    -1,    71,    -1,    73,
      -1,    74,    -1,    75,    -1,    72,    -1,    76,    -1,    77,
      -1,    78,    -1,    91,    -1,   104,    -1,   108,    -1,    35,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   124,   124,   127,   130,   133,   136,   139,   142,   145,
     148,   151,   155,   159,   162,   165,   169,   170,   173,   174,
     175,   176,   177,   178,   179,   180,   181,   182,   183,   184,
     185,   186,   187,   188,   191,   194,   197,   198,   201,   202,
     203,   206,   207,   208,   209,   210,   211,   212,   213,   214,
     215,   216,   217,   218,   219,   220,   221,   223,   224,   225,
     228,   229,   230,   233,   236,   237,   240,   241,   242,   245,
     247,   246,   251,   252,   255,   256,   257,   258,   259,   260,
     261,   262,   265,   266,   267,   268,   271,   274,   276,   277,
     278,   279,   280,   281,   284,   287,   290,   293,   294,   298,
     299,   300,   301,   302,   303,   304,   305,   309,   312,   315,
     316,   320,   321,   320,   322,   323,   322,   324,   324,   328,
     328,   329,   332,   333,   334,   335,   336,   337,   340,   343,
     346,   349,   350,   354,   355,   356,   357,   358,   359,   360,
     361,   362,   363,   364,   365,   366,   367,   368,   369
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "WORD", "END", "START_BRACKET",
  "STOP_BRACKET", "WEEKDAY", "LDAPDNSTR", "DESTINATION", "REWRITE", "ACL",
  "TIME", "TVAL", "DVAL", "DVALCRON", "SOURCE", "CIDR", "IPCLASS",
  "CONTINUE", "IPADDR", "DBHOME", "DOMAINLIST", "URLLIST",
  "EXPRESSIONLIST", "IPLIST", "DOMAIN", "USER", "USERLIST", "USERQUERY",
  "LDAPUSERSEARCH", "USERQUOTA", "IP", "PORT_NUMBER", "PORT", "NL",
  "NUMBER", "PASS", "REDIRECT", "LOGDIR", "SUBST", "CHAR", "MINUTELY",
  "HOURLY", "DAILY", "WEEKLY", "DATE", "WITHIN", "OUTSIDE", "ELSE",
  "LOGFILE", "ANONYMOUS", "VERBOSE", "CONTINIOUS", "SPORADIC",
  "LDAPCACHETIME", "EXECUSERLIST", "EXECCMD", "LDAPPROTOVER", "LDAPBINDDN",
  "LDAPBINDPASS", "MYSQLUSERNAME", "MYSQLPASSWORD", "DATABASE", "'-'",
  "'i'", "','", "'!'", "$accept", "start", "dbhome", "logdir",
  "ldapcachetime", "ldapprotover", "ldapbinddn", "ldapbindpass",
  "mysqlusername", "mysqlpassword", "mysqldb", "start_block", "stop_block",
  "destination", "destination_block", "destination_contents",
  "destination_content", "source", "source_block", "source_contents",
  "source_content", "domain", "user", "acl_block", "acl_contents", "acl",
  "acl_content", "@1", "access_contents", "access_content", "access_pass",
  "cidr", "ipclass", "ips", "ip", "rew", "rew_block", "rew_contents",
  "rew_content", "time", "time_block", "time_contents", "time_content",
  "@2", "@3", "@4", "@5", "@6", "ttime", "@7", "date", "dval", "tval",
  "dvalcron", "statements", "statement", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,    45,   105,    44,    33
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    83,    84,    84,
      84,    84,    84,    84,    84,    84,    84,    84,    84,    84,
      84,    84,    84,    84,    85,    86,    87,    87,    88,    88,
      88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
      88,    88,    88,    88,    88,    88,    88,    89,    89,    89,
      90,    90,    90,    91,    92,    92,    93,    93,    93,    94,
      95,    94,    96,    96,    97,    97,    97,    97,    97,    97,
      97,    97,    98,    98,    98,    98,    99,   100,   101,   101,
     101,   101,   101,   101,   102,   103,   104,   105,   105,   106,
     106,   106,   106,   106,   106,   106,   106,   107,   108,   109,
     109,   111,   112,   110,   113,   114,   110,   115,   110,   117,
     116,   116,   118,   118,   118,   118,   118,   118,   119,   120,
     121,   122,   122,   123,   123,   123,   123,   123,   123,   123,
     123,   123,   123,   123,   123,   123,   123,   123,   123
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     1,     1,     2,     4,     0,     2,     2,     2,
       2,     2,     2,     3,     2,     2,     2,     2,     2,     3,
       3,     4,     4,     2,     2,     4,     0,     2,     2,     2,
       2,     2,     4,     4,     4,     4,     2,     2,     2,     2,
       2,     3,     3,     4,     4,     2,     1,     0,     2,     2,
       0,     2,     2,     4,     0,     2,     1,     3,     3,     4,
       0,     9,     0,     2,     2,     2,     2,     3,     3,     4,
       4,     2,     0,     2,     3,     2,     1,     1,     0,     2,
       3,     3,     4,     2,     1,     2,     4,     0,     2,     1,
       2,     2,     3,     3,     4,     4,     2,     2,     4,     0,
       2,     0,     0,     5,     0,     0,     5,     0,     3,     0,
       5,     3,     2,     1,     4,     3,     2,     1,     1,     1,
       1,     0,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
     131,     0,     2,     1,     0,     0,     0,     0,     0,     0,
     148,     0,     0,     0,     0,     0,     0,     0,     0,   136,
     137,   141,   138,   139,   140,   142,   143,   144,   133,   135,
       0,   134,   145,     0,   146,     0,   147,   132,    14,    95,
      12,    64,   107,    34,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    16,    36,    97,   109,     0,     0,     0,
       0,     0,    66,    13,    63,     0,    65,     0,     0,     0,
       0,     0,     0,     0,     0,    15,    17,    56,     0,    57,
      60,     0,     0,    88,     0,     0,     0,     0,     0,    35,
      37,    99,     0,     0,     0,    96,    98,   111,   117,   108,
     110,     0,     0,    72,    26,    18,    19,    20,    21,    24,
      22,     0,    25,    27,    28,    33,     0,     0,    48,    38,
      39,    40,     0,    46,    47,    49,    50,    55,     0,     0,
      41,   100,   101,   106,     0,     0,     0,     0,     0,    67,
      68,     0,    23,    29,     0,    30,     0,    58,    59,    61,
      62,     0,    94,    93,    89,    51,     0,    52,     0,   102,
       0,   103,     0,   112,   115,   128,   130,   118,   123,   127,
       0,    82,     0,     0,    69,    73,    31,    32,    45,    42,
      43,    44,    86,    87,     0,    90,    91,    53,    54,   104,
     105,     0,     0,   129,     0,   122,     0,   126,    75,    74,
      76,    81,     0,     0,    70,    92,   113,   116,   125,     0,
       0,    83,    85,     0,    77,     0,    78,     0,     0,   124,
       0,   121,    84,    79,    80,    72,     0,     0,   120,    71
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    41,    64,    28,    29,    58,    76,    30,    31,    59,
      90,   119,   120,    32,    57,    65,    66,   218,   141,   175,
     199,   185,   186,   123,   154,    33,    34,    60,    96,    35,
      36,    61,   100,   136,   191,   137,   192,   138,   195,   209,
     167,   168,   196,   169,     2,    37
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -185
static const yytype_int16 yypact[] =
{
    -185,    16,    22,  -185,    15,    17,    23,    19,    27,    41,
    -185,    46,    50,    67,    48,    49,    60,   108,   110,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,    23,  -185,
      23,  -185,  -185,    23,  -185,    23,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,    21,   102,    73,
      96,    13,   -12,  -185,  -185,    23,  -185,   114,    11,    12,
       9,   115,   116,   119,     3,  -185,  -185,  -185,   124,  -185,
    -185,   125,    97,  -185,    98,   132,   142,    18,    -4,  -185,
    -185,  -185,   144,   148,    20,  -185,  -185,   146,  -185,  -185,
    -185,   152,   153,  -185,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,   154,  -185,  -185,  -185,  -185,    10,    42,  -185,     0,
       1,  -185,   122,    40,  -185,  -185,  -185,  -185,    26,    43,
    -185,  -185,  -185,  -185,    37,    44,   156,   155,   101,  -185,
    -185,   104,  -185,  -185,   157,  -185,   158,  -185,  -185,  -185,
    -185,    94,  -185,  -185,    33,  -185,   160,  -185,   161,  -185,
     162,  -185,   163,  -185,  -185,  -185,  -185,  -185,     4,   159,
     164,  -185,   165,    36,   120,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,   150,  -185,  -185,  -185,  -185,  -185,
    -185,   159,   159,  -185,   166,   168,   107,   168,  -185,    -2,
    -185,  -185,    38,    45,  -185,  -185,   168,   168,   159,   159,
     159,  -185,  -185,   170,  -185,   171,  -185,   172,    23,   168,
     112,  -185,  -185,  -185,  -185,  -185,   159,   104,  -185,  -185
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,   -28,   -50,  -185,  -185,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,   -47,  -185,
    -185,  -185,  -185,  -185,    -5,  -185,  -185,  -185,  -185,  -185,
    -185,  -185,  -185,  -185,  -185,  -185,  -185,  -185,   -60,  -185,
    -185,   -11,  -184,  -185,  -185,  -185
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -120
static const yytype_int16 yytable[] =
{
      53,   211,    54,   147,   149,    55,   115,    56,    75,    89,
      95,    99,   109,   143,   105,   107,     3,   193,    38,    63,
      39,   127,    42,   133,    62,   220,   221,    63,    40,   155,
      43,     4,     5,     6,     7,   101,   102,   103,     8,   201,
     159,   214,   228,     9,    44,   145,   157,   161,   216,    45,
     182,   183,    49,   130,   116,   117,    48,    10,    97,    98,
     152,    11,   144,    50,   212,   213,   148,   150,   194,   128,
     129,   134,   135,   110,   111,   106,   108,    12,   156,    63,
      13,    14,    15,    16,    17,    18,    46,   202,   203,   160,
     215,   174,    77,   146,   158,   162,   217,   184,    78,    79,
      80,    81,    63,    47,    82,    83,   153,    84,    63,   197,
      63,    51,    67,    52,   170,   165,   166,   104,   112,   113,
      85,    86,   114,    87,    68,    69,    70,   118,   121,    88,
     178,   206,   207,   122,   124,   125,    91,   179,   180,   181,
      71,   171,   172,    92,    93,   126,    94,   131,   219,    72,
      73,   132,    74,  -114,   173,   139,   140,   142,   151,   163,
     176,   177,   164,   187,   188,   189,   190,   198,   200,   204,
     152,   210,   193,   222,   223,   224,   226,   229,   227,   205,
     165,  -119,     0,   208,     0,     0,     0,     0,     0,     0,
     225
};

static const yytype_int16 yycheck[] =
{
      28,     3,    30,     3,     3,    33,     3,    35,    58,    59,
      60,    61,     3,     3,     3,     3,     0,    13,     3,     6,
       3,     3,     3,     3,     3,   209,   210,     6,     5,     3,
       3,     9,    10,    11,    12,    47,    48,    65,    16,     3,
       3,     3,   226,    21,     3,     3,     3,     3,     3,     3,
      17,    18,     3,    57,    51,    52,     8,    35,    45,    46,
      20,    39,    52,     3,    66,    67,    66,    66,    64,    51,
      52,    51,    52,    64,    65,    64,    64,    55,    52,     6,
      58,    59,    60,    61,    62,    63,    36,    51,    52,    52,
      52,   141,    19,    51,    51,    51,    51,    64,    25,    26,
      27,    28,     6,    36,    31,    32,    66,    34,     6,   169,
       6,     3,    10,     3,    10,    14,    15,     3,     3,     3,
      47,    48,     3,    50,    22,    23,    24,     3,     3,    56,
      36,   191,   192,    36,    36,     3,    40,    43,    44,    45,
      38,    37,    38,    47,    48,     3,    50,     3,   208,    47,
      48,     3,    50,     7,    50,     3,     3,     3,    36,     3,
       3,     3,     7,     3,     3,     3,     3,     3,     3,    49,
      20,    64,    13,     3,     3,     3,    64,   227,   225,   184,
      14,    13,    -1,   194,    -1,    -1,    -1,    -1,    -1,    -1,
     218
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    69,   122,     0,     9,    10,    11,    12,    16,    21,
      35,    39,    55,    58,    59,    60,    61,    62,    63,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    81,    82,
      85,    86,    91,   103,   104,   107,   108,   123,     3,     3,
       5,    79,     3,     3,     3,     3,    36,    36,     8,     3,
       3,     3,     3,    79,    79,    79,    79,    92,    83,    87,
     105,   109,     3,     6,    80,    93,    94,    10,    22,    23,
      24,    38,    47,    48,    50,    80,    84,    19,    25,    26,
      27,    28,    31,    32,    34,    47,    48,    50,    56,    80,
      88,    40,    47,    48,    50,    80,   106,    45,    46,    80,
     110,    47,    48,    79,     3,     3,    64,     3,    64,     3,
      64,    65,     3,     3,     3,     3,    51,    52,     3,    89,
      90,     3,    36,   101,    36,     3,     3,     3,    51,    52,
      57,     3,     3,     3,    51,    52,   111,   113,   115,     3,
       3,    96,     3,     3,    52,     3,    51,     3,    66,     3,
      66,    36,    20,    66,   102,     3,    52,     3,    51,     3,
      52,     3,    51,     3,     7,    14,    15,   118,   119,   121,
      10,    37,    38,    50,    80,    97,     3,     3,    36,    43,
      44,    45,    17,    18,    64,    99,   100,     3,     3,     3,
       3,   112,   114,    13,    64,   116,   120,   116,     3,    98,
       3,     3,    51,    52,    49,   102,   116,   116,   119,   117,
      64,     3,    66,    67,     3,    52,     3,    51,    95,   116,
     120,   120,     3,     3,     3,    79,    64,    96,   120,    80
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 3:
#line 127 "sg.y"
    { sgSetting("dbhome",(yyvsp[(2) - (2)].string)); }
    break;

  case 4:
#line 130 "sg.y"
    { sgSetting("logdir",(yyvsp[(2) - (2)].string)); }
    break;

  case 5:
#line 133 "sg.y"
    { sgSetting("ldapcachetime",(yyvsp[(2) - (2)].string)); }
    break;

  case 6:
#line 136 "sg.y"
    {sgSetting("ldapprotover",(yyvsp[(2) - (2)].string)); }
    break;

  case 7:
#line 139 "sg.y"
    { sgSetting("ldapbinddn",(yyvsp[(2) - (2)].string)); }
    break;

  case 8:
#line 142 "sg.y"
    { sgSetting("ldapbindpass",(yyvsp[(2) - (2)].string)); }
    break;

  case 9:
#line 145 "sg.y"
    { sgSetting("mysqlusername",(yyvsp[(2) - (2)].string)); }
    break;

  case 10:
#line 148 "sg.y"
    { sgSetting("mysqlpassword",(yyvsp[(2) - (2)].string)); }
    break;

  case 11:
#line 151 "sg.y"
    { sgSetting("mysqldb",(yyvsp[(2) - (2)].string)); }
    break;

  case 14:
#line 162 "sg.y"
    { sgDest((yyvsp[(2) - (2)].string)); }
    break;

  case 15:
#line 166 "sg.y"
    { sgDestEnd();}
    break;

  case 18:
#line 173 "sg.y"
    { sgDestDomainList((yyvsp[(2) - (2)].string)); }
    break;

  case 19:
#line 174 "sg.y"
    { sgDestDomainList(NULL); }
    break;

  case 20:
#line 175 "sg.y"
    { sgDestUrlList((yyvsp[(2) - (2)].string)); }
    break;

  case 21:
#line 176 "sg.y"
    { sgDestUrlList(NULL); }
    break;

  case 22:
#line 177 "sg.y"
    { sgDestExpressionList(NULL,NULL); }
    break;

  case 23:
#line 178 "sg.y"
    { sgDestExpressionList((yyvsp[(3) - (3)].string),"i"); }
    break;

  case 24:
#line 179 "sg.y"
    { sgDestExpressionList((yyvsp[(2) - (2)].string),"n"); }
    break;

  case 25:
#line 180 "sg.y"
    {sgDestRedirect((yyvsp[(2) - (2)].string)); }
    break;

  case 26:
#line 181 "sg.y"
    {sgDestRewrite((yyvsp[(2) - (2)].string)); }
    break;

  case 27:
#line 182 "sg.y"
    { sgDestTime((yyvsp[(2) - (2)].string),WITHIN); }
    break;

  case 28:
#line 183 "sg.y"
    { sgDestTime((yyvsp[(2) - (2)].string),OUTSIDE); }
    break;

  case 29:
#line 184 "sg.y"
    { sgLogFile(SG_BLOCK_DESTINATION,1,0,(yyvsp[(3) - (3)].string)); }
    break;

  case 30:
#line 185 "sg.y"
    { sgLogFile(SG_BLOCK_DESTINATION,0,1,(yyvsp[(3) - (3)].string)); }
    break;

  case 31:
#line 186 "sg.y"
    { sgLogFile(SG_BLOCK_DESTINATION,1,1,(yyvsp[(4) - (4)].string)); }
    break;

  case 32:
#line 187 "sg.y"
    { sgLogFile(SG_BLOCK_DESTINATION,1,1,(yyvsp[(4) - (4)].string)); }
    break;

  case 33:
#line 188 "sg.y"
    { sgLogFile(SG_BLOCK_DESTINATION,0,0,(yyvsp[(2) - (2)].string)); }
    break;

  case 34:
#line 191 "sg.y"
    { sgSource((yyvsp[(2) - (2)].string)); }
    break;

  case 35:
#line 194 "sg.y"
    {sgSourceEnd();}
    break;

  case 40:
#line 203 "sg.y"
    { sgSourceUserList((yyvsp[(2) - (2)].string)); }
    break;

  case 41:
#line 206 "sg.y"
    { sgSourceExecUserList((yyvsp[(2) - (2)].string)); }
    break;

  case 42:
#line 207 "sg.y"
    { sgSourceUserQuota((yyvsp[(2) - (4)].string),(yyvsp[(3) - (4)].string),"3600");}
    break;

  case 43:
#line 208 "sg.y"
    { sgSourceUserQuota((yyvsp[(2) - (4)].string),(yyvsp[(3) - (4)].string),"86400");}
    break;

  case 44:
#line 209 "sg.y"
    { sgSourceUserQuota((yyvsp[(2) - (4)].string),(yyvsp[(3) - (4)].string),"604800");}
    break;

  case 45:
#line 210 "sg.y"
    { sgSourceUserQuota((yyvsp[(2) - (4)].string),(yyvsp[(3) - (4)].string),(yyvsp[(4) - (4)].string));}
    break;

  case 47:
#line 212 "sg.y"
    { sgProxyPort((yyvsp[(2) - (2)].string)); }
    break;

  case 48:
#line 213 "sg.y"
    { sgSourceIpList((yyvsp[(2) - (2)].string)); }
    break;

  case 49:
#line 214 "sg.y"
    { sgSourceTime((yyvsp[(2) - (2)].string),WITHIN); }
    break;

  case 50:
#line 215 "sg.y"
    { sgSourceTime((yyvsp[(2) - (2)].string),OUTSIDE); }
    break;

  case 51:
#line 216 "sg.y"
    {sgLogFile(SG_BLOCK_SOURCE,1,0,(yyvsp[(3) - (3)].string));}
    break;

  case 52:
#line 217 "sg.y"
    {sgLogFile(SG_BLOCK_SOURCE,0,1,(yyvsp[(3) - (3)].string));}
    break;

  case 53:
#line 218 "sg.y"
    {sgLogFile(SG_BLOCK_SOURCE,1,1,(yyvsp[(4) - (4)].string));}
    break;

  case 54:
#line 219 "sg.y"
    {sgLogFile(SG_BLOCK_SOURCE,1,1,(yyvsp[(4) - (4)].string));}
    break;

  case 55:
#line 220 "sg.y"
    { sgLogFile(SG_BLOCK_SOURCE,0,0,(yyvsp[(2) - (2)].string)); }
    break;

  case 56:
#line 221 "sg.y"
    { lastSource->cont_search = 1; }
    break;

  case 58:
#line 224 "sg.y"
    { sgSourceDomain((yyvsp[(2) - (2)].string)); }
    break;

  case 61:
#line 229 "sg.y"
    { sgSourceUser((yyvsp[(2) - (2)].string)); }
    break;

  case 66:
#line 240 "sg.y"
    {sgAcl((yyvsp[(1) - (1)].string),NULL,0);}
    break;

  case 67:
#line 241 "sg.y"
    {sgAcl((yyvsp[(1) - (3)].string),(yyvsp[(3) - (3)].string),WITHIN);}
    break;

  case 68:
#line 242 "sg.y"
    { sgAcl((yyvsp[(1) - (3)].string),(yyvsp[(3) - (3)].string),OUTSIDE); }
    break;

  case 70:
#line 247 "sg.y"
    {sgAcl(NULL,NULL,ELSE);}
    break;

  case 74:
#line 255 "sg.y"
    { }
    break;

  case 75:
#line 256 "sg.y"
    { sgAclSetValue("rewrite",(yyvsp[(2) - (2)].string),0); }
    break;

  case 76:
#line 257 "sg.y"
    { sgAclSetValue("redirect",(yyvsp[(2) - (2)].string),0); }
    break;

  case 77:
#line 258 "sg.y"
    {sgLogFile(SG_BLOCK_ACL,1,0,(yyvsp[(3) - (3)].string));}
    break;

  case 78:
#line 259 "sg.y"
    {sgLogFile(SG_BLOCK_ACL,0,1,(yyvsp[(3) - (3)].string));}
    break;

  case 79:
#line 260 "sg.y"
    {sgLogFile(SG_BLOCK_ACL,1,1,(yyvsp[(4) - (4)].string));}
    break;

  case 80:
#line 261 "sg.y"
    {sgLogFile(SG_BLOCK_ACL,1,1,(yyvsp[(4) - (4)].string));}
    break;

  case 81:
#line 262 "sg.y"
    { sgLogFile(SG_BLOCK_ACL,0,0,(yyvsp[(2) - (2)].string)); }
    break;

  case 83:
#line 266 "sg.y"
    { sgAclSetValue("pass",(yyvsp[(2) - (2)].string),1);}
    break;

  case 84:
#line 267 "sg.y"
    { sgAclSetValue("pass",(yyvsp[(3) - (3)].string),0);}
    break;

  case 86:
#line 271 "sg.y"
    { sgIp((yyvsp[(1) - (1)].string)); }
    break;

  case 87:
#line 274 "sg.y"
    { sgIp((yyvsp[(1) - (1)].string)); }
    break;

  case 89:
#line 277 "sg.y"
    { sgIp("255.255.255.255") ; sgSetIpType(SG_IPTYPE_HOST,NULL,0); }
    break;

  case 90:
#line 278 "sg.y"
    { sgSetIpType(SG_IPTYPE_CIDR,NULL,0); }
    break;

  case 91:
#line 279 "sg.y"
    { sgSetIpType(SG_IPTYPE_CLASS,NULL,0); }
    break;

  case 92:
#line 280 "sg.y"
    { sgSetIpType(SG_IPTYPE_RANGE,NULL,0); }
    break;

  case 94:
#line 284 "sg.y"
    { sgIp((yyvsp[(1) - (1)].string));}
    break;

  case 95:
#line 287 "sg.y"
    { sgRewrite((yyvsp[(2) - (2)].string)); }
    break;

  case 99:
#line 298 "sg.y"
    { sgRewriteSubstitute((yyvsp[(1) - (1)].string)); }
    break;

  case 100:
#line 299 "sg.y"
    { sgRewriteTime((yyvsp[(2) - (2)].string),WITHIN); }
    break;

  case 101:
#line 300 "sg.y"
    { sgRewriteTime((yyvsp[(2) - (2)].string),OUTSIDE); }
    break;

  case 102:
#line 301 "sg.y"
    { sgLogFile(SG_BLOCK_REWRITE,1,0,(yyvsp[(3) - (3)].string)); }
    break;

  case 103:
#line 302 "sg.y"
    { sgLogFile(SG_BLOCK_REWRITE,0,1,(yyvsp[(3) - (3)].string)); }
    break;

  case 104:
#line 303 "sg.y"
    { sgLogFile(SG_BLOCK_REWRITE,1,1,(yyvsp[(4) - (4)].string)); }
    break;

  case 105:
#line 304 "sg.y"
    { sgLogFile(SG_BLOCK_REWRITE,1,1,(yyvsp[(4) - (4)].string)); }
    break;

  case 106:
#line 305 "sg.y"
    { sgLogFile(SG_BLOCK_REWRITE,0,0,(yyvsp[(2) - (2)].string)); }
    break;

  case 107:
#line 309 "sg.y"
    { sgTime((yyvsp[(2) - (2)].string)); }
    break;

  case 111:
#line 320 "sg.y"
    {sgTimeElementInit();}
    break;

  case 112:
#line 321 "sg.y"
    {sgTimeElementAdd((yyvsp[(3) - (3)].string),T_WEEKLY);}
    break;

  case 114:
#line 322 "sg.y"
    {sgTimeElementInit();}
    break;

  case 115:
#line 323 "sg.y"
    {sgTimeElementAdd((yyvsp[(3) - (3)].string),T_WEEKDAY);}
    break;

  case 117:
#line 324 "sg.y"
    {sgTimeElementInit();}
    break;

  case 118:
#line 325 "sg.y"
    {sgTimeElementEnd();}
    break;

  case 119:
#line 328 "sg.y"
    { sgTimeElementClone(); }
    break;

  case 128:
#line 340 "sg.y"
    { sgTimeElementAdd((yyvsp[(1) - (1)].string),T_DVAL);}
    break;

  case 129:
#line 343 "sg.y"
    { sgTimeElementAdd((yyvsp[(1) - (1)].tval),T_TVAL);}
    break;

  case 130:
#line 346 "sg.y"
    { sgTimeElementAdd((yyvsp[(1) - (1)].string),T_DVALCRON);}
    break;


/* Line 1267 of yacc.c.  */
#line 2172 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 372 "sg.y"


#if __STDC__
void sgReadConfig (char *file)
#else
void sgReadConfig (file)
     char *file;
#endif
{
  char *defaultFile=DEFAULT_CONFIGFILE;
  lineno = 1;
  configFile = file;
  if(configFile == NULL)
    configFile = defaultFile;
  yyin = fopen(configFile,"r");
  if(yyin == NULL) 
    sgLogFatalError("%s: can't open configfile  %s",progname, configFile);
  (void)yyparse();
  if(defaultAcl == NULL)
    sgLogFatalError("%s: default acl not defined in configfile  %s",
	progname, configFile);
  fclose(yyin);
}


/*
  
  Logfile functions

*/

#if __STDC__
void sgLogFile (int block, int anonymous, int verbose, char *file)
#else
void sgLogFile (block, anonymous, verbose, file)
     int block;
     int anonymous;
     int verbose;
     char *file;
#endif
{
  void **v;
  char *name;
  struct LogFile *p;
  switch(block){
  case(SG_BLOCK_DESTINATION):
    v = (void **) &lastDest->logfile;
    name = lastDest->name;
    break;
  case(SG_BLOCK_SOURCE):
    v = (void **) &lastSource->logfile;
    name = lastSource->name;
    break;
  case(SG_BLOCK_REWRITE):
    v = (void **) &lastRewrite->logfile;
    name = lastRewrite->name;
    break;
  case(SG_BLOCK_ACL):
    v = (void **) &lastAcl->logfile;
    name = lastAcl->name;
    if(strcmp(name,"default")){
      sgLogError("logfile not allowed in acl other than default");
    }
    break;
  default:
    return;
  }
  if(*v == NULL){
    p = (struct LogFile *) sgCalloc(1,sizeof(struct LogFile));
    p->stat = sgLogFileStat(file);
    p->parent_name = name;
    p->parent_type = block;
    p->anonymous = anonymous;
    p->verbose = verbose;
    *v = p;
  } else {
    sgLogError("%s: redefine of logfile %s in line %d",
		    progname,file,lineno);
    return;
  }
}

#if __STDC__
struct LogFileStat *sgLogFileStat(char *file)
#else
struct LogFileStat *sgLogFileStat(file)
     char *file;
#endif
{
  struct LogFileStat *sg;
  struct stat s;
  char buf[MAX_BUF];
  FILE *fd;
  strncpy(buf,file,MAX_BUF);
  if(*file != '/'){
    if(globalLogDir == NULL)
      strncpy(buf,DEFAULT_LOGDIR,MAX_BUF);
    else
      strncpy(buf,globalLogDir,MAX_BUF);
    strcat(buf,"/");
    strcat(buf,file);
  }
  if((fd = fopen(buf, "a")) == NULL){
    sgLogError("%s: can't write to logfile %s",progname,buf);
    return NULL;
  }
  if(stat(buf,&s) != 0){
    sgLogError("%s: can't stat logfile %s",progname,buf);
    return NULL;
  }
  if(LogFileStat == NULL){
    sg = (struct LogFileStat *) sgCalloc(1,sizeof(struct LogFileStat));
    sg->name = sgMalloc(strlen(buf) + 1);
    strcpy(sg->name,buf);
    sg->st_ino = s.st_ino;
    sg->st_dev = s.st_dev;
    sg->fd = fd;
    sg->next = NULL;
    LogFileStat = sg;
    lastLogFileStat = sg;
  } else {
    for(sg = LogFileStat; sg != NULL; sg = sg->next){
      if(sg->st_ino == s.st_ino && sg->st_dev == s.st_dev){
	fclose(fd);
	return sg;
      }
    }
    sg = (struct LogFileStat *) sgCalloc(1,sizeof(struct LogFileStat));
    sg->name = sgMalloc(strlen(buf) + 1);
    strcpy(sg->name,buf);
    sg->st_ino = s.st_ino;
    sg->st_dev = s.st_dev;
    sg->fd = fd;
    sg->next = NULL;
    lastLogFileStat->next = sg;
    lastLogFileStat = sg;
  }
  return lastLogFileStat;
}
/*
  
  Source functions

*/

#if __STDC__
void sgSource(char *source)
#else
void sgSource(source)
     char *source;
#endif
{
  struct Source *sp;
  if(Source != NULL){
    if((struct Source *) sgSourceFindName(source) != NULL)
      sgLogFatalError("%s: source %s is defined in configfile %s",
		      progname,source, configFile);
  }
  sp = (struct Source *)sgCalloc(1,sizeof(struct Source));
  sp->ip=NULL;
  sp->proxy_port = 0;
  sp->userDb=NULL;
  sp->domainDb=NULL;
  sp->active = 1;
  sp->within = 0;
  sp->cont_search = 0;
  sp->time = NULL;
  sp->userquota.seconds = 0;
  sp->userquota.renew = 0;
  sp->userquota.sporadic = 0;
  sp->next=NULL;
  sp->logfile = NULL;
  sp->name = (char  *) sgCalloc(1,strlen(source) + 1);
  strcpy(sp->name,source);

  if(Source == NULL){
    Source = sp;
    lastSource = sp;
  } else {
    lastSource->next = sp;
    lastSource = sp;
  }
}

#ifdef HAVE_LIBLDAP
void sgSourceEnd()
{
 struct Source *s;
 s = lastSource;
 if(s->ip == NULL && s->domainDb == NULL && s->userDb == NULL
       && s->ldapurlcount == 0 && s->proxy_port == 0){
   sgLogError("sourceblock %s missing active content, set inactive",s->name);
   s->time = NULL;
   s->active = 0;
 }
}
#else
void sgSourceEnd()
{
 struct Source *s;
 s = lastSource;
 if(s->ip == NULL && s->domainDb == NULL && s->userDb == NULL && s->proxy_port == 0){
   sgLogError("sourceblock %s missing active content, set inactive",s->name);
   s->time = NULL;
   s->active = 0;
 }
}
#endif

#if __STDC__
void sgSourceUser(char *user)
#else
void sgSourceUser(user)
     char *user;
#endif
{
  struct Source *sp;
  char *lc;
  sp = lastSource;
  if(sp->userDb == NULL){
    sp->userDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
    sp->userDb->type=SGDBTYPE_USERLIST;
    sgDbInit(sp->userDb,NULL);
  }
  for(lc=user; *lc != '\0'; lc++) /* convert username to lowercase chars */
    *lc = tolower(*lc);
  sgDbUpdate(sp->userDb, user, (char *) setuserinfo(),
            sizeof(struct UserInfo));
// DEBUG
  sgLogError("Added User: %s", user);
}

#if __STDC__
void sgSourceUserList(char *file)
#else
void sgSourceUserList(file)
     char *file;
#endif
{
  char *dbhome = NULL, *f;
  FILE *fd;
  char line[MAX_BUF];
  char *p,*c,*s,*lc;
  int l=0;
  struct Source *sp;
  sp = lastSource;
  if(sp->userDb == NULL){
    sp->userDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
    sp->userDb->type=SGDBTYPE_USERLIST;
    sgDbInit(sp->userDb,NULL);
  }
  dbhome = sgSettingGetValue("dbhome");
  if(dbhome == NULL)
    dbhome = DEFAULT_DBHOME;
  if (file[0] == '/') {
    f = strdup(file);
  } else {
    f = (char  *) sgCalloc(1,strlen(dbhome) + strlen(file) + 5);
    strcpy(f,dbhome);
    strcat(f,"/");
    strcat(f,file);
  }
  if((fd = fopen(f,"r")) == NULL){
    sgLogError("%s: can't open userlist %s: %s",progname, f,strerror(errno));
    return;
  }
  while(fgets(line,sizeof(line),fd) != NULL){
    l++;
    if(*line == '#')
      continue;
    p = strchr(line,'\n');
    if(p != NULL && p != line){
      if(*(p - 1) == '\r') /* removing ^M  */
	p--;
      *p = '\0';
    }
    c = strchr(line,'#');
    p = strtok(line," \t,");
    if((s = strchr(line,':')) != NULL){
      *s = '\0';
      for(lc=line; *lc != '\0'; lc++) /* convert username to lowercase chars */
	*lc = tolower(*lc);
      sgDbUpdate(sp->userDb, line, (char *) setuserinfo(),
                sizeof(struct UserInfo));
    } else {
      do {
	if(c != NULL && p >= c) /*find the comment */
	  break;
	for(lc=p; *lc != '\0'; lc++) /* convert username to lowercase chars */
	  *lc = tolower(*lc);
       sgDbUpdate(sp->userDb, p, (char *) setuserinfo(),
                  sizeof(struct UserInfo));
// DEBUG
        sgLogError("Added UserList source: %s", p);
      } while((p=strtok(NULL," \t,")) != NULL);
    }
  }
  fclose(fd);
}


/* MySQLsupport */
#ifdef HAVE_MYSQL
#if __STDC__
void sgSourceUserQuery(char *query)
#else
void sgSourceUserQuery(query)
     char *query;
#endif
{
  char *dbhome = NULL, *f;
  MYSQL *conn;
  MYSQL_RES *res;
  MYSQL_ROW *row;
  char line[MAX_BUF];
  char *my_query, *my_user, *my_pass, *my_db;
  char *str=";";
  int l=0;
  struct Source *sp;
  sp = lastSource;
  if(sp->userDb == NULL){
    sp->userDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
    sp->userDb->type=SGDBTYPE_USERLIST;
    sgDbInit(sp->userDb,NULL);
  }
  dbhome = sgSettingGetValue("dbhome");
  my_user = sgSettingGetValue("mysqlusername");
  my_pass = sgSettingGetValue("mysqlpassword");
  my_db = sgSettingGetValue("mysqldb");
  if(dbhome == NULL) {
    dbhome = DEFAULT_DBHOME;
  }
  if( !(conn = mysql_init(0)) ) {
     sgLogError("%s: can't open userquery: mysql init",progname); 
    return;
  }
  if( ! mysql_real_connect(conn, "localhost", my_user, my_pass, my_db,
      0,NULL,0) ) {
     sgLogError("%s: can't open userquery: mysql connect",progname); 
    return;
  }
  my_query=(char *)calloc(strlen(query) + strlen(str) + 1,sizeof(char));
  strcat(my_query, query);
  strcat(my_query, str);
  /* DEBUG:   sgLogError("%s: TEST: MySQL Query %s",progname,my_query);  */
  if( mysql_query(conn, my_query) ) {
     sgLogError("%s: can't open userquery: mysql query",progname); 
    return;
  }
  res = mysql_use_result(conn);
  while( row = mysql_fetch_row(res) ) {
    strncpy(line, row[0], sizeof(line)-1);
    l++;
    sgDbUpdate(sp->userDb, line, (char *) setuserinfo(), sizeof(struct UserInfo));
    sgLogError("Added MySQL source: %s", line);
  }
  mysql_free_result(res);
  mysql_close(conn);
 }
#endif


/* LDAP Support */
#ifdef HAVE_LIBLDAP
#if __STDC__
void sgSourceLdapUserSearch(char *url)
#else
void sgSourceLdapUserSearch(url)
     char *url;
#endif
{
  struct Source *sp;
  sp = lastSource;

/*  DEBUG
  sgLogError("sgSourceLdapUserSearch called with: %s", url);
*/

  if(!ldap_is_ldap_url(url)) {
     sgLogError("%s: can't parse LDAP url %s",progname, url);  
    return;
  }

  /* looks ok, add the url to the source object url array */
  sp->ldapurls = (char**) sgRealloc(sp->ldapurls,
                                    sizeof(char*) * (sp->ldapurlcount+1));
  sp->ldapurls[sp->ldapurlcount] = (char*) sgMalloc(strlen(url) + 1);
  strcpy(sp->ldapurls[sp->ldapurlcount], url);
  sp->ldapurlcount++;

  /* create a userDb if it doesn't exist, since we'll need it later
   * for caching */
  if(sp->userDb == NULL){
    sp->userDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
    sp->userDb->type=SGDBTYPE_USERLIST;
    sgDbInit(sp->userDb,NULL);
  }
}
#endif

#if __STDC__
void sgSourceExecUserList(char *cmd)
#else
void sgSourceExecUserList(cmd)
     char *cmd;
#endif
{
  FILE *pInput;
  char buffer[100];
  struct Source *sp;
  char *lc;
  sp = lastSource;
  if(sp->userDb == NULL){
    sp->userDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
    sp->userDb->type=SGDBTYPE_USERLIST;
    sgDbInit(sp->userDb,NULL);
  }

/*  DEBUG
  sgLogError("sgSourceExecUserList called with: %s", cmd);
*/

  pInput = popen(cmd, "r");
  if(pInput == NULL) {
    sgLogError("%s: Unable to run execuserlist command: %s", progname, cmd);
    return;
  }

  while(fgets(buffer, sizeof(buffer), pInput) != NULL) {
    char *sc;
    /* skip leading whitespace */
    for(sc=buffer; *sc != '\0' && isspace(*sc); sc++)
    ;
    /* convert username to lowercase */
    for(lc=sc; *lc != '\0'; lc++)
      *lc = tolower(*lc);
    /* remove newline and trailing whitespace */
    while(lc>=sc && (*lc=='\0' || isspace(*lc)))
      *lc-- = '\0';
    if(lc >= sc) {
      sgDbUpdate(sp->userDb, sc, (char *) setuserinfo(),
                 sizeof(struct UserInfo));
// DEBUG
      sgLogError("Added exec source: %s", sc);
    }
  }

  pclose(pInput);
}



#if __STDC__
void sgSourceUserQuota(char *seconds, char *sporadic, char *renew)
#else
void sgSourceUserQuota(seconds, sporadic, renew)
     char *seconds;
     char *sporadic;
     char *renew;
#endif
{
  int s;
  struct UserQuota *uq;
  struct Source *sp;
  sp = lastSource;
  uq = &sp->userquota;
  s = atoi(seconds);
  if(s <= 0)
    sgLogError("Userquota seconds sporadic hourly|daily|weekly");
  uq->seconds = s; 
  s = atoi(sporadic);
  if(s <= 0)
    sgLogError("Userquota seconds sporadic hourly|daily|weekly");
  uq->sporadic = s; 
  s = atoi(renew);
  if(s <= 0)
    sgLogError("Userquota seconds sporadic hourly|daily|weekly");
  uq->renew = s;
}


#if __STDC__
void sgSourceDomain(char *domain)
#else
void sgSourceDomain(domain)
     char *domain;
#endif
{
  struct Source *sp;
  sp = lastSource;
  if(sp->domainDb == NULL){
    sp->domainDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
    sp->domainDb->type=SGDBTYPE_DOMAINLIST;
    sgDbInit(sp->domainDb,NULL);
  }
  sgDbUpdate(sp->domainDb,domain, NULL, 0);
}

#if __STDC__
void sgSourceTime(char *name, int within)
#else
void sgSourceTime(name, within)
     char *name;
     int within;
#endif
{
  struct Time *time = NULL;
  struct Source *sp;
  sp = lastSource;
  if((time = sgTimeFindName(name)) == NULL){
    sgLogFatalError("%s: Time %s is not defined in configfile %s",
		    progname,name, configFile);
  }
  sp->within = within;
  sp->time = time;
}

#if __STDC__
struct Source *sgSourceFindName(char *name)
#else
struct Source *sgSourceFindName(name)
     char *name;
#endif
{
  struct Source *p;
  for(p=Source; p != NULL; p = p->next){
    if(!strcmp(name,p->name))
      return p;
  }
  return NULL;
}

#if __STDC__
void sgSourceIpList(char *file)
#else
void sgSourceIpList(file)
     char *file;
#endif
{
  char *dbhome = NULL, *f;
  FILE *fd;
  char line[MAX_BUF];
  char *p,*c,*cidr;
  int i,l=0;
  dbhome = sgSettingGetValue("dbhome");
  if(dbhome == NULL)
    dbhome = DEFAULT_DBHOME;
  if (file[0] == '/') {
    f = strdup(file);
  } else {
    f = (char  *) sgCalloc(1,strlen(dbhome) + strlen(file) + 5);
    strcpy(f,dbhome);
    strcat(f,"/");
    strcat(f,file);
  }
  if((fd = fopen(f,"r")) == NULL){
    sgLogError("%s: can't open iplist %s: %s",progname, f,strerror(errno));
    return;
  }
  sgLogError("init iplist %s",f);
  while(fgets(line,sizeof(line),fd) != NULL){
    l++;
    if(*line == '#')
      continue;
    p = strchr(line,'\n');
    if(p != NULL && p != line){
      if(*(p - 1) == '\r') /* removing ^M  */
	p--;
      *p = '\0';
    }
    c = strchr(line,'#');
    p = strtok(line," \t,");
    do {
      if(c != NULL && p >= c) /*find the comment */
	break;
      i=strspn(p,".0123456789/-");
      if(i == 0)
	break;
      *(p + i ) = '\0';
      if((cidr = strchr(p,'/')) != NULL){
	*cidr = '\0';
	cidr++;
	sgIp(p);
	sgIp(cidr);
	if(strchr(cidr,'.') == NULL)
	  sgSetIpType(SG_IPTYPE_CIDR,f,l);
	else 
	  sgSetIpType(SG_IPTYPE_CLASS,f,l);
      } else if((cidr = strchr(p,'-')) != NULL) {
	*cidr = '\0';
	cidr++;
	sgIp(p);
	sgIp(cidr);
	sgSetIpType(SG_IPTYPE_RANGE,f,l);
      } else {
	sgIp(p);
	sgIp(strdup("255.255.255.255"));
	sgSetIpType(SG_IPTYPE_HOST,f,l);
      }
    } while((p=strtok(NULL," \t,")) != NULL);
  }
  fclose(fd);
}

/*
  

 */

#if __STDC__
struct Source *sgFindSource (struct Source *bsrc, 
			     char *net, char *ident, char *domain, int proxy_port)
#else
struct Source *sgFindSource (bsrc, net, ident, domain, proxy_port)
     struct Source *bsrc;
     char *net;
     char *ident;
     char *domain;
     int proxy_port;
#endif
{
  struct Source *s;
  struct Ip *ip;
  int foundip, founduser, founddomain, foundport, unblockeduser;
  unsigned long i, octet = 0, *op;
  struct UserInfo *userquota;
  if(net != NULL){
    op = sgConvDot(net);
    if(op != NULL)
      octet = *op;
  }
  for(s=bsrc; s != NULL; s = s->next){
    foundip = founduser = founddomain = foundport = 0;
    unblockeduser = 1;
    if(s->active == 0)
      continue;
      
    if(s->proxy_port != 0){
      if(s->proxy_port == proxy_port){
        // sgLogError("sgFindSource: proxy port matched");
        foundport = 1;
      } 
    }
    else {
      // sgLogError("sgFindSource: no proxy port");
      foundport = 1;
    }
    
    if(s->ip != NULL){
      if(net == NULL)
	foundip = 0;
      else {
	for(ip=s->ip; ip != NULL; ip = ip->next){
	  if(ip->net_is_set == 0)
	    continue;
	  if(ip->type == SG_IPTYPE_RANGE){
	    if(octet >= ip->net && octet <= ip->mask){
	      foundip = 1;
	      break;
	    }
	  } else { /* CIDR or HOST */
	    i = octet & ip->mask;
	    if(i == ip->net){
	      foundip = 1;
	      break;
	    }
	  }
	}
      }
    } else
      foundip = 1;
    if(s->userDb != NULL){
      if(*ident == '\0')
	founduser = 0;
      else {
#ifdef HAVE_LIBLDAP
        if(sgFindUser(s, ident, &userquota)) {
#else
        rfc1738_unescape(ident);
        if(defined(s->userDb, ident, (char **) &userquota) == 1){
#endif
	  founduser = 1;
	  unblockeduser = 1;
	  if(s->userquota.seconds != 0){
            struct UserInfo uq;
	    time_t t = time(NULL) + globalDebugTimeDelta;
	    //sgLogError("status %d time %d lasttime %d consumed %d", userquota->status, userquota->time, userquota->last, userquota->consumed);
	    //sgLogError("renew %d seconds %d", s->userquota.renew, s->userquota.seconds);
	    if(userquota->status == 0){ //first time
	      userquota->status = 1;
	      userquota->time = t;
	      userquota->last = t;
	      //sgLogError("user %s first time %d", ident, userquota->time);
	    } else if(userquota->status == 1){
	      //sgLogError("user %s other time %d %d",ident,userquota->time,t);
	      if(s->userquota.sporadic > 0){
		if(t - userquota->last  < s->userquota.sporadic){
		  userquota->consumed += t - userquota->last;
		  userquota->time = t;
		}
		if(userquota->consumed > s->userquota.seconds){
		  userquota->status = 2; // block this user, time is up
		  unblockeduser = 0;
		}
		userquota->last = t;
		//sgLogError("user %s consumed %d %d",ident,userquota->consumed, userquota->last);
	      } else if(userquota->time + s->userquota.seconds < t){
		sgLogError("time is up user %s blocket", ident);
		userquota->status = 2; // block this user, time is up
		unblockeduser = 0;
	      } 
	    } else {
	      //sgLogError("user %s blocket %d %d %d %d", ident, userquota->status, userquota->time, t, (userquota->time + s->userquota.renew) - t);
	      if(userquota->time + s->userquota.renew < t){ // new chance
		//sgLogError("user %s new chance", ident);
		unblockeduser = 1;
		userquota->status = 1;
		userquota->time = t;
		userquota->consumed = 0;
	      } else 
		unblockeduser = 0;
	    }
	    sgDbUpdate(s->userDb, ident, (void *) userquota, 
                      sizeof(struct UserInfo));
	  }
	}
      }
    } else
      founduser = 1;
    if(s->domainDb != NULL){
      if(*domain == '\0')
	founddomain = 0;
      else {
	if(defined(s->domainDb, domain, (char **) NULL) == 1)
	  founddomain = 1;
      }
    } else
      founddomain = 1;
    if(founduser && foundip && founddomain && foundport){
      if(unblockeduser)
	return s;
      else {
	lastActiveSource = s;
	return NULL;
      }
    }
  }
  return NULL;
}



/*destination block funtions */

#if __STDC__
void sgDest(char *dest)
#else
void sgDest(dest)
     char *dest;
#endif
{
  struct Destination *sp;
  if(Dest != NULL){
    if((struct Destination *) sgDestFindName(dest) != NULL)
      sgLogFatalError("%s: destination %s is defined in configfile %s",
		   progname,dest, configFile);
  }
  sp = (struct Destination *) sgCalloc(1,sizeof(struct Destination));
  sp->domainlist=NULL;
  sp->urllist=NULL;
  sp->expressionlist=NULL;
  sp->redirect=NULL;
  sp->rewrite=NULL;
  sp->active = 1;
  sp->time = NULL;
  sp->within = 0;
  sp->logfile = NULL;
  sp->next=NULL;
  sp->name = (char  *) sgCalloc(1,strlen(dest) + 1);
  strcpy(sp->name,dest);

  if(Dest == NULL){
    Dest = sp;
    lastDest = sp;
  } else {
    lastDest->next = sp;
    lastDest = sp;
  }
}

void sgDestEnd()
{
 struct Destination *d;
 d = lastDest;
 if(d->domainlist == NULL && d->urllist == NULL && d->expressionlist == NULL
    && d->redirect == NULL && d->rewrite == NULL){
   sgLogError("destblock %s missing active content, set inactive",d->name);
   d->time = NULL;
   d->active = 0;
 }
}

#if __STDC__
void sgDestDomainList(char *domainlist)
#else
void sgDestDomainList(domainlist)
     char *domainlist;
#endif
{
  struct Destination *sp;
  char *dbhome = NULL, *dl = domainlist, *name;
  dbhome = sgSettingGetValue("dbhome");
  sp = lastDest;
  if(dbhome == NULL)
    dbhome = DEFAULT_DBHOME;
 if(domainlist == NULL){
    name = sp->name;
    dl = (char *) sgCalloc(1,strlen("/dest/") + strlen(name) + strlen("/domainlist"));
    strcpy(dl,"/dest/");
    strcat(dl,name);
    strcat(dl,"/domainlist");
    sp->domainlist = (char  *) sgCalloc(1,strlen(dbhome) + strlen("/") + strlen(dl) + 4);
    strcpy(sp->domainlist,dbhome);
    strcat(sp->domainlist,"/");
    strcat(sp->domainlist,dl);
    sgFree(dl);
  } else {
    if (domainlist[0] == '/') {
      sp->domainlist = strdup(domainlist);
    } else {
    sp->domainlist = (char  *) sgCalloc(1,strlen(dbhome) + strlen("/") + strlen(domainlist) + 4);
    strcpy(sp->domainlist,dbhome);
    strcat(sp->domainlist,"/");
    strcat(sp->domainlist,domainlist);
    }
  }
  sp->domainlistDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
  sp->domainlistDb->type=SGDBTYPE_DOMAINLIST;
  sgLogError("init domainlist %s",sp->domainlist);
  sgDbInit(sp->domainlistDb,sp->domainlist);
  if(sp->domainlistDb->entries == 0) { /* empty database */
    sgLogError("domainlist empty, removed from memory");
    sgFree(sp->domainlistDb);
    sp->domainlistDb = NULL;
  }
}

#if __STDC__
void sgDestUrlList(char *urllist)
#else
void sgDestUrlList(urllist)
     char *urllist;
#endif
{
  struct Destination *sp;
  char *dbhome = NULL, *dl = urllist, *name;
  dbhome = sgSettingGetValue("dbhome");
  sp = lastDest;
  if(dbhome == NULL)
    dbhome = DEFAULT_DBHOME;
  if(urllist == NULL){
    name = sp->name;
    dl = (char *) sgCalloc(1,strlen("/dest/") + strlen(name) + strlen("/urllist"));
    strcpy(dl,"/dest/");
    strcat(dl,name);
    strcat(dl,"/urllist");
    sp->urllist = (char  *) sgCalloc(1,strlen(dbhome) + strlen("/") + strlen(dl) + 4);
    strcpy(sp->urllist,dbhome);
    strcat(sp->urllist,"/");
    strcat(sp->urllist,dl);
    sgFree(dl);
  } else {
    if (urllist[0] == '/') {
      sp->urllist = strdup(urllist);
    } else {
    sp->urllist = (char  *) sgCalloc(1,strlen(dbhome) + strlen("/") + strlen(urllist) + 4);
    strcpy(sp->urllist,dbhome);
    strcat(sp->urllist,"/");
    strcat(sp->urllist,urllist);
    }
  }
  sp->urllistDb = (struct sgDb *) sgCalloc(1,sizeof(struct sgDb));
  sp->urllistDb->type=SGDBTYPE_URLLIST;
  sgLogError("init urllist %s",sp->urllist);
  sgDbInit(sp->urllistDb,sp->urllist);
  if(sp->urllistDb->entries == 0) { /* empty database */
    sgLogError("urllist empty, removed from memory");
    sgFree(sp->urllistDb);
    sp->urllistDb = NULL;
  }
}

#if __STDC__
void sgDestExpressionList(char *exprlist, char *chcase)
#else
void sgDestExpressionList(exprlist, chcase)
     char *exprlist;
     char *chcase;
#endif
{
  FILE *fp;
  char buf[MAX_BUF],errbuf[256];
  struct Destination *sp;
  struct sgRegExp *regexp;
  char *dbhome = NULL, *dl = exprlist, *name, *p;
  int flags = REG_EXTENDED;
  dbhome = sgSettingGetValue("dbhome");
  sp = lastDest;
  if(dbhome == NULL)
    dbhome = DEFAULT_DBHOME;
  if(exprlist == NULL){
    name = sp->name;
    dl = (char *) sgCalloc(1,strlen("/dest/") +strlen(name) + strlen("/expressionlist"));
    strcpy(dl,"/dest/");
    strcat(dl,name);
    strcat(dl,"/expressionlist");
    flags |= REG_ICASE; /* default case insensitive */
    sp->expressionlist = (char  *) sgCalloc(1,strlen(dbhome)+strlen(dl)+10);
    strcpy(sp->expressionlist,dbhome);
    strcat(sp->expressionlist,"/");
    strcat(sp->expressionlist,dl);
    sgFree(dl);
  } else {
    if (exprlist[0] == '/') {
      sp->expressionlist = strdup(exprlist);
    } else {
    sp->expressionlist = (char  *) sgCalloc(1,strlen(dbhome) + strlen("/") + strlen(exprlist) + 4);
    strcpy(sp->expressionlist,dbhome);
    strcat(sp->expressionlist,"/");
    strcat(sp->expressionlist,exprlist);
    }
    if(strncmp(chcase,"c",1))
          flags |= REG_ICASE; /* set case insensitive */
  }
  sgLogError("init expressionlist %s",sp->expressionlist);
  if ((fp = fopen(sp->expressionlist, "r")) == NULL) 
    sgLogFatalError("%s: %s", sp->expressionlist, strerror(errno));
  while(fgets(buf, sizeof(buf), fp) != NULL){
    p = (char *) strchr(buf,'\n');
    if(p != NULL && p != buf){
      if(*(p - 1) == '\r') /* removing ^M  */
	p--;
      *p = '\0';
    }
    regexp=sgNewPatternBuffer(buf,flags);
    if(regexp->error){
      regerror(regexp->error,regexp->compiled, errbuf,sizeof(errbuf));
      sgLogError("%s: %s", sp->expressionlist, strerror(errno));
    }
    if(lastDest->regExp == NULL){
      lastDest->regExp = regexp;
      lastRegExpDest = regexp;
    } else {
      lastRegExpDest->next = regexp;
      lastRegExpDest = regexp;
    }
  }
  fclose(fp);
}

#if __STDC__
void sgDestRedirect(char *value)
#else
void sgDestRedirect(value)
     char *value;
#endif
{
  struct Destination *sp;
  sp = lastDest;
  sp->redirect = (char *) sgCalloc(1,strlen(value) + 1);
  strcpy(sp->redirect,value);
}

void sgDestRewrite(char *value){
  struct sgRewrite *rewrite = NULL;
  struct Destination *sp;
  sp = lastDest;
  if((rewrite = sgRewriteFindName(value)) == NULL){
    sgLogFatalError("%s: Rewrite %s is not defined in configfile %s",
		    progname,value, configFile);
  }
  sp->rewrite = rewrite;
}

#if __STDC__
int sgRegExpMatch(struct sgRegExp *regexp, char *str)
#else
int sgRegExpMatch(regexp, str)
     struct sgRegExp *regexp;
     char *str;
#endif
{
  struct sgRegExp *rp;
  static char errbuf[256];
  int error;
  for(rp = regexp; rp != NULL; rp = rp->next){
    error = regexec(rp->compiled, str, 0,0,0);
    if(error != 0 && error != REG_NOMATCH) {
      regerror(error,rp->compiled, errbuf,sizeof(errbuf));
      sgLogError("Error in regex %30.30s %-60.60s  %d %s\n",rp->pattern,str,error,errbuf);
    }
    if(error == 0) /* match */
      return 1;
  }
  return 0;
}

#if __STDC__
void sgDestTime(char *name, int within)
#else
void sgDestTime(name, within)
     char *name;
     int within;
#endif
{
  struct Time *time = NULL;
  struct Destination *sp;
  sp = lastDest;
  if((time = sgTimeFindName(name)) == NULL){
    sgLogFatalError("%s: Time %s is not defined in configfile %s",
		    progname,name, configFile);
  }
  sp->within = within;
  sp->time = time;
}

#if __STDC__
struct Destination *sgDestFindName(char *name)
#else
struct Destination *sgDestFindName(name)
     char *name;
#endif
{
  struct Destination *p;
  for(p=Dest; p != NULL; p = p->next){
    if(!strcmp(name,p->name))
      return p;
  }
  return NULL;
}

/*
  Setting functions
*/


#if __STDC__
void sgSetting(char *name, char *value)
#else
void sgSetting(name, value)
     char *name;
     char *value;
#endif
{
  struct Setting *sp;
  if(Setting != NULL){
    if((struct Setting *) sgSettingFindName(name) != NULL)
      sgLogFatalError("%s: setting %s is defined in configfile %s",
		      progname,name, configFile);
  }
  sp = (struct Setting *) sgCalloc(1,sizeof(struct Setting));

  sp->name = strdup(name);
  sp->value = strdup(value);

// DEBUG
  sgLogError("New setting: %s: %s", name, value);


  if(Setting == NULL){
    Setting = sp;
    lastSetting = sp;
  } else {
    lastSetting->next = sp;
    lastSetting = sp;
  }
  if(!strcmp(name,"logdir")){
    globalLogDir= strdup(value);
  }
}

#if __STDC__
struct Setting *sgSettingFindName(char *name)
#else
struct Setting *sgSettingFindName(name)
     char *name;
#endif
{
  struct Setting *p;
  for(p=Setting; p != NULL; p = p->next){
    if(!strcmp(name,p->name))
      return p;
  }
  return NULL;
}


#if __STDC__
char *sgSettingGetValue(char *name)
#else
char *sgSettingGetValue(name)
     char *name;
#endif
{
  struct Setting *p;
  p = sgSettingFindName(name);
  if(p != NULL)
    return p->value;
  return NULL;
}


/*
  
  sgRewrite function

 */

#if __STDC__
void sgRewrite(char *rewrite)
#else
void sgRewrite(rewrite)
     char *rewrite;
#endif
{
  struct sgRewrite *rew;
  if(Rewrite != NULL){
    if((struct sgRewrite *) sgRewriteFindName(rewrite) != NULL)
      sgLogFatalError("%s: rewrite %s is defined in configfile %s",
		      progname,rewrite, configFile);
  }
  rew = (struct sgRewrite *) sgCalloc(1,sizeof(struct sgRewrite));
  rew->name = strdup(rewrite);
  rew ->rewrite = NULL;
  rew->logfile = NULL;
  rew->time = NULL;
  rew->active = 1;
  rew->within = 0;
  rew->next=NULL;

  if(Rewrite == NULL){
    Rewrite = rew;
    lastRewrite = rew;
  } else {
    lastRewrite->next = rew;
    lastRewrite = rew;
  }
}

#if __STDC__
void sgRewriteTime(char *name, int within)
#else
void sgRewriteTime(name, within)
     char *name;
     int within;
#endif
{
  struct Time *time = NULL;
  struct sgRewrite *sp;
  sp = lastRewrite;
  if((time = sgTimeFindName(name)) == NULL){
    sgLogFatalError("%s: Time %s is not defined in configfile %s",
		    progname,name, configFile);
  }
  sp->within = within;
  sp->time = time;
}

#if __STDC__
void sgRewriteSubstitute (char *string)
#else
void sgRewriteSubstitute (string)
     char *string;
#endif
{
  char *pattern, *subst = NULL , *p;
  int flags = REG_EXTENDED ;
  int global = 0;
  char *httpcode = NULL;
  struct sgRegExp *regexp;
  char errbuf[256];
  pattern = string + 2 ; /* skipping s@ */
  p = pattern;
  while((p = strchr(p,'@')) != NULL){
    if(*( p - 1) != '\\'){
      *p = '\0';
      subst = p + 1;
      break;
    }
    p++;
  }
  p= strrchr(subst,'@');
  while(p != NULL && *p != '\0'){
    if(*p == 'r' )
      httpcode =  REDIRECT_TEMPORARILY;
    if(*p == 'R' )
      httpcode =  REDIRECT_PERMANENT;
    if(*p == 'i' || *p == 'I')
      flags |= REG_ICASE;
    if(*p == 'g')
      global = 1;
    *p = '\0'; /*removes @i from string */
    p++;
  } 
  regexp=sgNewPatternBuffer(pattern,flags);
  if(regexp->error){
      regerror(regexp->error,regexp->compiled, errbuf,sizeof(errbuf));
      sgLogError("Error in regexp %s: %s",pattern,errbuf);
  } else {
    regexp->substitute = strdup(subst);
  }
  if(lastRewrite->rewrite == NULL)
    lastRewrite->rewrite = regexp;
  else 
    lastRewriteRegExec->next=regexp;
  regexp->httpcode = httpcode;
  regexp->global = global;
  lastRewriteRegExec = regexp;
}

#if __STDC__
char *sgRewriteExpression(struct sgRewrite *rewrite, char *subst)
#else
char *sgRewriteExpression(rewrite, subst)
     struct sgRewrite *rewrite;
     char *subst;
#endif
{
  char *result = NULL;
  result = sgRegExpSubst(rewrite->rewrite, subst);
  return result;
}

#if __STDC__
struct sgRewrite *sgRewriteFindName(char *name)
#else
struct sgRewrite *sgRewriteFindName(name)
     char *name;
#endif
{
  struct sgRewrite *p;
  for(p=Rewrite; p != NULL; p = p->next){
    if(!strcmp(name,p->name))
      return p;
  }
  return NULL;
}



/*
  Time functions
*/

#if __STDC__
void sgTime(char *name)
#else
void sgTime(name)
     char *name;
#endif
{
  struct Time *t;
  if(Time != NULL){
    if((struct Time *) sgTimeFindName(name) != NULL)
      sgLogFatalError("%s: time %s is defined in configfile %s",
		      progname,name, configFile);
  } else 
    numTimeElements = 0;
  t = (struct Time *) sgCalloc(1,sizeof(struct Time));
  t->name = strdup(name);
  t->element = NULL;
  t->active = 1;
  TimeElement = NULL;
  lastTimeElement = NULL;
  if(Time == NULL){
    Time = t;
    lastTime = t;
  } else {
    lastTime->next = t;
    lastTime = t;
  }
}

#if __STDC__
void sgTimeElementInit()
#else
void sgTimeElementInit()
#endif
{
  struct TimeElement *te;
  te = (struct TimeElement *) sgCalloc(1,sizeof(struct TimeElement));
  numTimeElements++;
  if(lastTime->element == NULL)
    lastTime->element = te;
  if(lastTimeElement != NULL)
    lastTimeElement->next = te;
  lastTimeElement = te;
}

#if __STDC__
void sgTimeElementEnd ()
#else
void sgTimeElementEnd ()
#endif
{
  time_switch = 0;
  date_switch = 0;
  if(lastTimeElement->fromdate !=0){
    if(lastTimeElement->todate == 0)
      lastTimeElement->todate = lastTimeElement->fromdate + 86399;
    else 
      lastTimeElement->todate = lastTimeElement->todate + 86399;
  }
  if(lastTimeElement->from == 0 && lastTimeElement->to == 0)
    lastTimeElement->to = 1439; /* set time to 23:59 */
}

#if __STDC__
void sgTimeElementAdd (char *element, char type) 
#else
void sgTimeElementAdd (element, type) 
     char *element;
     char type;
#endif
{
  struct TimeElement *te;
  char *p;
  char wday = 0;
  int h,m,Y,M = 0,D = -1;
  time_t sec;
  te = lastTimeElement;
  switch(type) {
  case T_WEEKDAY:
    p = strtok(element," \t,");
    do {
      if(*p == '*'){
	wday = 127;
      } else if(!strncmp(p,"sun",3)){
	wday = wday | 0x01;
      } else if(!strncmp(p,"mon",3)){
	wday = wday | 0x02;
      } else if(!strncmp(p,"tue",3)){
	wday = wday | 0x04;
      } else if(!strncmp(p,"wed",3)){
	wday = wday | 0x08;
      } else if(!strncmp(p,"thu",3)){
	wday = wday | 0x10;
      } else if(!strncmp(p,"fri",3)){
	wday = wday | 0x20;
      } else if(!strncmp(p,"sat",3)){
	wday = wday | 0x40;
      }
      p=strtok(NULL," \t,");
    } while(p != NULL);
    te->wday = wday;
    break;
  case T_TVAL:
    sscanf(element,"%d:%d",&h,&m);
    if((h < 0 && h > 24) && (m < 0 && m > 59))
      sgLogFatalError("%s: time formaterror in %s line %d",
		      progname, configFile,lineno);
    if(time_switch == 0){
      time_switch++;
      te->from = (h * 60) + m ;
    } else {
      time_switch=0;
      te->to = (h * 60) + m ;
    }
    break;
  case T_DVAL:
    sec = date2sec(element);
    if(sec == -1){
      sgLogFatalError("%s: date formaterror in %s line %d",
		      progname, configFile,lineno);
    }
    if(date_switch == 0){
      date_switch++;
      te->fromdate = sec;
    } else {
      date_switch=0;
      te->todate = sec;
    }
    break;
  case T_DVALCRON:
    p = strtok(element,"-.");
    Y = atoi(p);
    if(*p == '*')
      Y = -1;
    else
      Y = atoi(p);
    while((p=strtok(NULL,"-.")) != NULL){
      if(*p == '*')
	if(M == 0)
	  M = -1;
	else 
	  D = -1;
      else
	if(M == 0)
	  M = atoi(p);
	else
	  D = atoi(p);
    }
    te->y=Y; te->m=M; te->d=D;
    break;
  case T_WEEKLY:
    p = element;
    while(*p != '\0'){
      switch(*p){
      case 'S':
      case 's':
	wday = wday | 0x01;
	break;
      case 'M':
      case 'm':
	wday = wday | 0x02;
	break;
      case 'T':
      case 't':
	wday = wday | 0x04;
	break;
      case 'W':
      case 'w':
	wday = wday | 0x08;
	break;
      case 'H':
      case 'h':
	wday = wday | 0x10;
	break;
      case 'F':
      case 'f':
	wday = wday | 0x20;
	break;
      case 'A':
      case 'a':
	wday = wday | 0x40;
	break;
      default:
	sgLogFatalError("%s: weekday formaterror in %s line %d",
			progname, configFile,lineno);
	break;
      }
      p++;
    }
    te->wday = wday;
    break;
  }
}


#if __STDC__
struct Time *sgTimeFindName(char *name)
#else
struct Time *sgTimeFindName(name)
     char *name;
#endif
{
  struct Time *p;
  for(p=Time; p != NULL; p = p->next){
    if(!strcmp(name,p->name))
      return p;
  }
  return NULL;
}

#if __STDC__
int sgTimeCmp(const int *a, const int *b)
#else
int sgTimeCmp(a, b)
     const int *a;
     const int *b;
#endif
{
  return *a - *b;
}

#if __STDC__
void sgTimeElementSortEvents()
#else
void sgTimeElementSortEvents()
#endif
{
 struct Time *p;
 struct TimeElement *te;
 int i = 0,j;
 int *t;
 if(Time != NULL){
   TimeElementsEvents = (int *) sgCalloc(numTimeElements * 2 , sizeof(int)); 
   t = (int *) sgCalloc(numTimeElements * 2, sizeof(int)); 
   for(p = Time; p != NULL; p = p->next){
     for(te = p->element; te != NULL; te = te->next){
       TimeElementsEvents[i++]= te->from == 0 ? 1440 : te->from;
       TimeElementsEvents[i++]= te->to == 0 ? 1440 : te->to;
     }
   }
   qsort(TimeElementsEvents,numTimeElements * 2,sizeof(int),
	 (void *) &sgTimeCmp);
   for(i=0,j=0; i < numTimeElements * 2; i++){
     if(j==0){
       t[j++] = TimeElementsEvents[i];
     } else {
       if(t[j-1] != TimeElementsEvents[i]){
	 t[j++]=TimeElementsEvents[i];
       }
     }
   }
   sgFree(TimeElementsEvents);
   numTimeElements = j;
   TimeElementsEvents = t;
 }
}

#if __STDC__
int sgTimeNextEvent()
#else
int sgTimeNextEvent()
#endif
{
  time_t t;
  struct tm *lt;
  int m = 0; 
  static int lastval= 0;
  static int index = 0;
#if HAVE_SIGACTION
  struct sigaction act;
#endif
  if(Time == NULL)
    return 0;
  t = time(NULL) + globalDebugTimeDelta;

  lt = localtime(&t); 
  m = (lt->tm_hour * 60) + lt->tm_min ;
  
  for(index=0; index < numTimeElements; index++){
    if(TimeElementsEvents[index] >= m){
      break;
    }
  }
  lastval = TimeElementsEvents[index];
#if HAVE_SIGACTION
#ifndef SA_NODEFER
#define SA_NODEFER 0
#endif
  act.sa_handler = sgAlarm;
  act.sa_flags = SA_NODEFER | SA_RESTART;
  sigaction(SIGALRM, &act, NULL);
#else
#if HAVE_SIGNAL
  signal(SIGALRM, &sgAlarm);
#else
#endif
#endif
  if(lastval < m )
    m = (((1440 - m ) + lastval) * 60) - lt->tm_sec;
  else
    m = ((lastval - m) * 60) - lt->tm_sec;
  if(m <= 0)
    m = 30;
  sgLogError("Info: recalculating alarm in %d seconds", (unsigned int)m); 
  alarm((unsigned int) m);
  sgTimeCheck(lt,t);
  sgTimeSetAcl();
  return 0;
}

#if __STDC__
int sgTimeCheck(struct tm *lt, time_t t)
#else
int sgTimeCheck(lt, t)
     struct tm *lt;
     time_t t;
#endif
{
  struct Time *sg;
  struct TimeElement *te;
  int min;
  if(Time == NULL)
    return -1;
  for(sg = Time; sg != NULL; sg = sg->next){
    sg->active = 0;
    for(te = sg->element; te != NULL ; te = te->next){
      if(te->wday != 0){
	if(((1 << lt->tm_wday ) & te->wday) != 0) {
	  min = (lt->tm_hour * 60 ) + lt->tm_min;
	  if(min >= te->from && min < te->to){
	    sg->active = 1;
	    break;
	  }
	}
      } else { /* date */
	if(te->fromdate != 0){
	  if(t >= te->fromdate && t <= te->todate){
	    min = (lt->tm_hour * 60 ) + lt->tm_min;
	    if(min >= te->from && min < te->to){
	      sg->active =1;
	      break;
	    }
	  }
	} else { /* cron */
	  if(te->y == -1 || te->y == (lt->tm_year + 1900)){
	    if(te->m == -1 || te->m == (lt->tm_mon + 1)){
	      if(te->d == -1 || te->d == (lt->tm_mday)){
		min = (lt->tm_hour * 60 ) + lt->tm_min;
		if(min >= te->from && min < te->to){
		  sg->active =1;
		  break;
		}
	      }
	    }
	  }
	}
      }
    }
  }
  return 0;
}

void sgTimeSetAcl()
{
  struct Acl *acl = defaultAcl;
  struct Destination *d;
  struct Source *s;
  struct sgRewrite *rew;
  for(acl=Acl; acl != NULL; acl = acl->next){
    if(acl->time != NULL){
      acl->active = acl->time->active;
      if(acl->within == OUTSIDE){
	if(acl->active){
	  acl->active = 0;
        }
	else {
	  acl->active = 1;
        }
      }
      if(acl->next != NULL && acl->next->within == ELSE){
	if(acl->active == 0){
	  acl->next->active = 1;
	} else {
	  acl->next->active = 0;
	}
      }
    }
  }
  for(d = Dest; d != NULL; d = d->next){
    if(d->time != NULL){
      d->active = d->time->active;
      if(d->within == OUTSIDE){
	if(d->active){
	  d->active = 0;
	} else {
	  d->active = 1;
        }
      }
    }
  }
  for(s = Source; s != NULL; s = s->next){
    if(s->time != NULL){
      s->active = s->time->active;
      if(s->within == OUTSIDE){
	if(s->active){
	  s->active = 0;
        }
	else  {
	  s->active = 1;
        }
      }
    }
  }
  for(rew = Rewrite; rew != NULL; rew = rew->next){
    if(rew->time != NULL){
      rew->active = rew->time->active;
      if(rew->within == OUTSIDE)
	if(rew->active)
	  rew->active = 0;
	else
	  rew->active = 1;
    }
  }
}

void sgTimeElementClone() {
  struct TimeElement *te = lastTimeElement, *tmp;
  if ( lastTimeElement == NULL ) {
    sgLogFatalError("No prev TimeElement in sgTimeElementClone !");
  } else {
    sgTimeElementInit();
    lastTimeElement->wday = te->wday;
    lastTimeElement->from = te->from;
    lastTimeElement->to = te->to;
    lastTimeElement->y = te->y;
    lastTimeElement->m = te->m;
    lastTimeElement->d = te->d;
    lastTimeElement->fromdate = te->fromdate;
    lastTimeElement->todate = te->todate;
    tmp = lastTimeElement;
    lastTimeElement = te;
    sgTimeElementEnd();
    lastTimeElement = tmp;
  }
}

void sgTimePrint() {
  struct Time *t;
  struct TimeElement *te;
  for(t = Time; t != NULL; t = t->next){
    printf("Time %s is ",t->name);
    t->active ? printf("active\n") : printf("inactive\n");
    for(te = t->element; te != NULL; te = te->next){
      printf("\tte->wday     = %x\n",te->wday);
      printf("\tte->from     = %d\n",te->from);
      printf("\tte->to       = %d\n",te->to);
      printf("\tte->y,m,d    = %d-%d-%d\n",te->y,te->m,te->d);
      printf("\tte->fromdate = %s\n",te->fromdate == 0 ?
             "0" : niso(te->fromdate));
      printf("\tte->todate   = %s\n\n",te->todate == 0 ?
             "0" : niso(te->todate));
    }
  }
}


/*
  Ip functions
*/


#if __STDC__
void sgSetIpType(int type, char *file, int line)
#else
void sgSetIpType(type, file, line)
     int type;
     char *file;
     int line;
#endif
{
  struct Ip *ip = sgIpLast(lastSource),*nip;
  char *p;
  char *f = file == NULL ? configFile : file;
  int l = line == 0 ? lineno : line ;
  unsigned long octet, *op = NULL;
  if(type == SG_IPTYPE_HOST)
    ip->mask = 0xffffffff;
  if(type == SG_IPTYPE_RANGE){
    if((op=sgConvDot(ip->str)) == NULL)
      sgLogFatalError("%s: address error in %s line %d", progname, f,l);
    else 
      ip->mask = *op;
    if(ip->net > ip->mask)
      sgLogFatalError("%s: iprange error in %s line %d", progname, f,l);
  }
  if(type == SG_IPTYPE_CLASS){
    p=ip->str;
    if(*p == '/')
      p++;
    if((op=sgConvDot(p)) == NULL)
      sgLogFatalError("%s: address error in %s line %d", progname, f,l);
    else 
      ip->mask = *op;
  }
  if(type == SG_IPTYPE_CIDR){
    p=ip->str;
    if(*p == '/')
      p++;
    octet = atoi(p);
    if(octet < 0 || octet > 32){
      sgLogFatalError("%s: prefix error /%s in %s line %d",
		      progname,p, f,l);
    }
    if(octet == 32)
      ip->mask = 0xffffffff;
    else
      ip->mask = 0xffffffff ^ (0xffffffff >> octet);
    ip->net = ip->net & ip->mask;
  }
  ip->type = type;
  nip = (struct Ip *) sgCalloc(1,sizeof(struct Ip));
  ip->next = nip ;
}

#if __STDC__
void sgIp(char *name)
#else
void sgIp(name)
     char *name;
#endif
{
  struct Ip *ip;
  unsigned long *op;
  if(lastSource->ip == NULL){
    ip = (struct Ip *) sgCalloc(1,sizeof(struct Ip));
    ip->next = NULL;
    lastSource->ip = ip;
    lastSource->lastip = ip;
  } else {
    ip = sgIpLast(lastSource);
  }
  if(ip->net_is_set == 0){
    ip->net_is_set = 1;
    if((op=sgConvDot(name)) == NULL){
      sgLogFatalError("%s: address error in %s line %d", progname, configFile,lineno);
    } else 
      ip->net = *op;
  } else {
    ip->str = (char *) sgCalloc(1,strlen(name) + 1);
    strcpy(ip->str,name);
  }
}

#if __STDC__
void sgProxyPort(char *port)
#else
void sgProxyPort(port)
      char *port;
#endif
{
  int tmp;
  tmp = atoi(port);
  lastSource->proxy_port = tmp;
  sgLogError("source port: %d", tmp);
}


#if __STDC__
struct Ip *sgIpLast(struct Source *s)
#else
struct Ip *sgIpLast(s)
     struct Source *s;
#endif
{
  struct Ip *ip,*ret = NULL ;
  for(ip=s->ip; ip != NULL; ip = ip->next)
    ret = ip;
  return ret;
}

/*
  ACL functions
*/


#if __STDC__
void sgAcl(char *name, char *value, int within)
#else
void sgAcl(name, value, within)
     char *name;
     char *value;
     int within;
#endif
{
  struct Acl *acl;
  struct Source *source = NULL;
  struct Time *time = NULL;
  int def = 0;
  char *s;
  if(name != NULL){
    /* due to some strange things in my yacc code */
    if((s=(char *) strchr(name,' ')) != NULL)
      *s='\0';    
    if((s=(char *) strchr(name,'\t')) != NULL)
      *s='\0';    
    /*
    if(Acl != NULL){
      if((struct Acl *) sgAclFindName(name) != NULL){
	sgLogFatalError("%s: ACL %s is defined in configfile %s",
			progname,name, configFile);
      }
    }
    */
  }
  if(lastAcl != NULL && name == NULL && within == ELSE) 
    name = lastAcl->name;
  acl = (struct Acl *)sgCalloc(1,sizeof(struct Acl));
  if(!strcmp(name,"default")){
    defaultAcl=acl;
    def++;
  } else {
    if((source = sgSourceFindName(name)) == NULL && !def){
      sgLogFatalError("%s: ACL source %s is not defined in configfile %s",
		      progname,name, configFile);
    }
  }
  acl->name = sgCalloc(1,strlen(name) + 1);
  strcpy(acl->name,name);
  acl->active = within == ELSE ? 0 : 1;
  acl->source = source;
  acl->pass = NULL;
  acl->rewriteDefault = 1;
  acl->rewrite = NULL;
  acl->redirect = NULL;
  acl->within = within;
  acl->logfile = NULL;
  acl->next = NULL;
  if(value != NULL){
    if((time = sgTimeFindName(value)) == NULL){
      sgLogFatalError("%s: ACL time %s is not defined in configfile %s",
		      progname,value, configFile);
    }
    acl->time = time;
  }
  if(Acl == NULL){
    Acl = acl;
    lastAcl = acl;
  } else {
    lastAcl->next = acl;
    lastAcl = acl;
  }
}

#if __STDC__
void sgAclSetValue (char *what, char *value, int allowed) 
#else
void sgAclSetValue (what, value, allowed)
     char *what;
     char *value;
     int allowed;
#endif
{
  struct Destination *dest = NULL;
  struct sgRewrite *rewrite = NULL;
  struct AclDest *acldest;
  int type = ACL_TYPE_TERMINATOR;
  if(!strcmp(what,"pass")){
    if(!strcmp(value,"any") || !strcmp(value,"all"))
      allowed = 1;
    else if(!strcmp(value,"none"))
      allowed=0;
    else if(!strcmp(value,"in-addr")){
      type = ACL_TYPE_INADDR;
    } else {
      if((dest = sgDestFindName(value)) == NULL){
	sgLogFatalError("%s: ACL destination %s is not defined in configfile %s",
			progname,value, configFile);
      } 
      type = ACL_TYPE_DEFAULT;
    }

    acldest = sgCalloc(1,sizeof(struct AclDest));
    acldest->name = (char *) sgCalloc(1,strlen(value) + 1);
    strcpy(acldest->name,value);
    acldest->dest = dest;
    acldest->access = allowed;
    acldest->type = type;
    acldest->next = NULL;
    if(lastAcl->pass == NULL){
      lastAcl->pass = acldest;
    } else {
      lastAclDest->next = acldest;
    }
    lastAclDest = acldest;
  }

  if(!strcmp(what,"rewrite")){
    if(!strcmp(value,"none")){
      lastAcl->rewriteDefault = 0;
      lastAcl->rewrite = NULL;
    } else {
      if((rewrite = sgRewriteFindName(value)) == NULL){
	sgLogFatalError("%s: Rewrite %s is not defined in configfile %s",
			progname,value, configFile);
      }
      lastAcl->rewriteDefault = 0;
      lastAcl->rewrite = rewrite;
    }
  }
  if(!strcmp(what,"redirect")){
    if(strcmp(value,"default")){
      lastAcl->redirect = (char *) sgCalloc(1,strlen(value) + 1);
      strcpy(lastAcl->redirect,value);
    } else {
      lastAcl->redirect= NULL;
    }
  }
}

#if __STDC__
struct Acl *sgAclFindName(char *name)
#else
struct Acl *sgAclFindName(name)
     char *name;
#endif
{
  struct Acl *p;
  for(p=Acl; p != NULL; p = p->next){
    if(!strcmp(name,p->name))
      return p;
  }
  return NULL;
}


#if __STDC__
struct Acl *sgAclCheckSource(struct Source *source)
#else
struct Acl *sgAclCheckSource(source)
     struct Source *source;
#endif
{
  struct Acl *acl = defaultAcl;
  int found = 0;
  if(source != NULL){
    for(acl=Acl; acl != NULL; acl = acl->next){
      if(acl->source == source){
	if(acl->active){
	  found++;
	  break;
	} else {
	  if(acl->next->source == source && acl->next->active != 0){
	    found++;
	    acl=acl->next;
	    break;
	  }
	}
      }
    }
  }

  else {
      if( globalDebug == 1 ) { sgLogError("source not found"); }
       }

  if(!found) {
    acl = defaultAcl;

    if( globalDebug == 1 ) { sgLogError("no ACL matching source, using default"); }

  }
  return acl;
}

#if __STDC__
char *sgAclAccess(struct Source *src, struct Acl *acl, struct SquidInfo *req)
#else
char *sgAclAccess(src, acl, req)
     struct Source *src;
     struct Acl *acl;
     struct SquidInfo *req;
#endif
{
  int access = 1,result;
  char *redirect = NULL, *dbdata = NULL, *p;
  struct sgRewrite *rewrite = NULL;
  struct AclDest *aclpass = NULL;
  if(acl == NULL)
    return NULL;
  if(acl->pass == NULL)
    acl->pass = defaultAcl->pass;
  if(acl->pass != NULL){
    for(aclpass = acl->pass; aclpass != NULL; aclpass = aclpass->next){
      if(aclpass->dest != NULL && !aclpass->dest->active)
	continue;
      if(aclpass->type == ACL_TYPE_TERMINATOR){
	access=aclpass->access;
	break;
      }
      if(aclpass->type == ACL_TYPE_INADDR){
	if(req->dot){
	  access=aclpass->access;
	  break;
	}
	continue;
      }
      if(aclpass->dest->domainlistDb != NULL){
	result = defined(aclpass->dest->domainlistDb, req->domain, &dbdata);
       if(result != DB_NOTFOUND) {
         if(result){
           if(aclpass->access){
             access++;
             break; 
           } else {
             access = 0;
             break;
           }
	  }
	}
      else {
      }
      }
      if(aclpass->dest->urllistDb != NULL && access){
       result = defined(aclpass->dest->urllistDb,req->strippedurl, &dbdata);
       if (!result) {
         result = defined(aclpass->dest->urllistDb,req->furl, &dbdata);
       }
       if ((result) && (result != DB_NOTFOUND)) {
    if(aclpass->access){
      access++;
      break;
    } else {
      access = 0;
      break;
    }
  }
       else {
	}
      }
      if(aclpass->dest->regExp != NULL && access){
	if((result = sgRegExpMatch(aclpass->dest->regExp,req->strippedurl)) != 0){
	  if(aclpass->access){
	    access++;
	    break;
	  } else {
	    access = 0;
	    break;
	  }
	}
      }
    }
    if(!access){
      if(dbdata != NULL)
	redirect = dbdata;
      else if(aclpass->dest != NULL && aclpass->dest->redirect != NULL)
	redirect = aclpass->dest->redirect;
      else if(aclpass->dest != NULL && aclpass->dest->rewrite != NULL &&
	      (redirect = 
	       sgRewriteExpression(aclpass->dest->rewrite,req->orig)) != NULL){
	;
      }
      else if(acl->redirect == NULL)
	redirect = defaultAcl->redirect;
      else
	redirect = acl->redirect;
    }
  } else {  /* acl->pass == NULL, probably defaultAcl->pass == NULL */
    access=0;
    redirect = defaultAcl->redirect;
  }
  if(acl->rewrite == NULL)
    rewrite = defaultAcl->rewrite;
  else
    rewrite = acl->rewrite;
  if(rewrite != NULL && access){
    if((p = sgRewriteExpression(rewrite,req->orig)) != NULL){
      redirect = p;
      if(rewrite->logfile != NULL){
	globalLogFile = rewrite->logfile;
       sgLogRequest(globalLogFile,req,acl,aclpass,rewrite,REQUEST_TYPE_REWRITE);
       return redirect;
      }
    }
  } else if(redirect != NULL) {
    redirect = sgParseRedirect(redirect, req, acl, aclpass);
  }
  if(src != NULL && src->logfile != NULL)
    globalLogFile = src->logfile;
  if(aclpass == NULL || aclpass->dest == NULL){
    if(defaultAcl->logfile != NULL)
     globalLogFile = defaultAcl->logfile;
  } else
    if(aclpass->dest->logfile != NULL)
      globalLogFile = aclpass->dest->logfile;
  if(globalLogFile != NULL) {
    if(redirect != NULL) {
      sgLogRequest(globalLogFile,req,acl,aclpass,NULL,REQUEST_TYPE_REDIRECT);
    } else {
      sgLogRequest(globalLogFile,req,acl,aclpass,NULL,REQUEST_TYPE_PASS);
    }
  }
  return redirect;
}

#if __STDC__
void yyerror(char *s)
#else
void yyerror(s)
     char *s;
#endif
{
  sgLogFatalError("%s in configfile %s line %d",s,configFile,lineno);
}


#if __STDC__
int yywrap()
#else
int yywrap()
#endif
{
  return 1;
}

/* returns 1 if user was found for the specified Source
 * returns a pointer to a UserInfo structure when found
 * handles all LDAP sub-lookups and caching
 */
#if __STDC__
int sgFindUser(struct Source *src, char *ident, struct UserInfo **rval)
#else
int sgFindUser(src, ident, rval)
       struct Source *src;
       char *ident;
       struct UserInfo **rval;
#endif

{
       int i, found;
       int CacheTimeOut;
       char *interval;
       struct UserInfo *userinfo;
       static struct UserInfo info;

       /* defined in the userDB? */
       if(defined(src->userDb, ident, (char **) &userinfo) == 1) {
#ifdef HAVE_LIBLDAP
               /* LDAP user? */
               if(!userinfo->ldapuser) {
                       *rval = userinfo;
                       return 1;       /* no, return regular user */
               }

               /* from here on, we assume it is an LDAP user */

               /* is this info valid? */
               interval = sgSettingGetValue("ldapcachetime");
               CacheTimeOut = atoi(interval != NULL ? interval : "0");
               if((time(NULL) - userinfo->cachetime) <= CacheTimeOut) {
                       if(userinfo->found)
                               *rval = userinfo;
                       return userinfo->found; /* yes */
               }
#endif
       }
       else {
               userinfo = NULL;        /* no record defined, must add our own*/
       }

       found = 0;                      /* assume not found */

#ifdef HAVE_LIBLDAP
       /* loop through all LDAP URLs and do a search */
       for(i = 0; i < src->ldapurlcount; i++) {

               found = sgDoLdapSearch(src->ldapurls[i], ident);

               /* cache every search in the user database */
               /* this should be safe, since squid only sends real idents
                  that have been authenticated (?) */

               /* any record defined from above? */
               if(userinfo == NULL) {
                       /* no, must use our own memory */
                       userinfo = &info;
                       info.status = 0;
                       info.time = 0;
                       info.consumed = 0;
                       info.last = 0;
                       info.ldapuser = 1;
                       info.found = found;
                       info.cachetime = time(NULL);
               }
               else {
                       /* yes, just update the found flag */
                       userinfo->found = found;
                       userinfo->cachetime = time(NULL);
               }

               sgDbUpdate(src->userDb, ident, (char *) userinfo,
                       sizeof(struct UserInfo));
                sgLogError("Added LDAP source: %s", ident); 

               if(found) {
                       *rval = userinfo;
                       break;
               }
       }
#endif
       return found;
}

#ifdef HAVE_LIBLDAP

#if __STDC__
static int get_ldap_errno(LDAP *ld)
#else
static int get_ldap_errno(ld)
           LDAP *ld;
#endif

{
  int err = 0;
  if(ld) {
    if(ldap_get_option(ld, LDAP_OPT_ERROR_NUMBER, &err) != LDAP_OPT_SUCCESS)
        err = 0;
  }
  return err;
}

/* 
 * expand_url - expand the %s codes in the given LDAP url
 *
 * Returns:  1 on success, 0 on error
 *
 *   char *expand;             destination buffer for expanded URL
 *   size_t expand_size;       size of dest buffer (sizeof() works here)
 *   char *url;                        original URL (MAXWORDLEN)
 *   char *s_item;             word to replace each occurance of %s with
 */
int expand_url(char *expand, size_t expand_size, const char *url,
              const char *s_item)
{
       int item_length;
       char *end = expand + expand_size;

       item_length = strlen(s_item);

       while (*url && expand < end) {
              if (url[0] == '%' && url[1] == 's') {
                       /* check buffer overrun */
                       if ((expand + item_length) >= end)
                               return 0;
                       strcpy(expand, s_item);
                       expand += item_length;  

                       url += 2;
               }
               else { 
                       *expand++ = *url++;
               }
       }

       if (expand < end) {
               *expand = '\0';         /* null terminate string */
               return 1;
       }
       else {
               return 0;
       }
}


/* does a raw LDAP search and returns 1 if found, 0 if not */
#if __STDC__
int sgDoLdapSearch(const char *url, const char *username)
#else
int sgDoLdapSearch(url, username)
       const char *url;
       const char *username;
#endif
{
       LDAPURLDesc *lud;
       LDAP *ld;
       LDAPMessage *ldapresult, *ldapentry;
       char *binddn = NULL, *bindpass = NULL;
       int ext_i;
       char **ldapvals;
       char buffer[MAX_BUF];
       int found = 0;
       int protoversion = -1;                  /* default to library defaults*/
       char *protosetting;

       /* Which protocol version should we use? */
       protosetting = sgSettingGetValue("ldapprotover");
       if (protosetting != NULL) {
               if (atoi(protosetting) == 3) {
                       protoversion = LDAP_VERSION3;
               }
               else if (atoi(protosetting) == 2) {
                       protoversion = LDAP_VERSION2;
               }
       }

       /* insert the username into the url, if needed... allow multiple %s */
       if (!expand_url(buffer, sizeof(buffer), url, username)) {
               sgLogError("%s: unable to expand LDAP URL: size: %u, username: "
                       "%s url: %s", progname, sizeof(buffer), username, url);
               return found;
       }

       /* Parse RFC2255 LDAP URL */
       if(ldap_url_parse(buffer, &lud)) {
               sgLogError("%s: can't parse LDAP url %s",progname, buffer);
               return found;
       }

       /* get a handle to an LDAP connection */
       if((ld = ldap_init(lud->lud_host, lud->lud_port)) == NULL) {
               sgLogError("%s: ldap_init(%s, %d) failed: %s", progname,
                       lud->lud_host, lud->lud_port, strerror(errno));
               ldap_free_urldesc(lud);
               return found;
       }

       /* force an LDAP protocol version if set */
       if (protoversion != -1) {
               if (ldap_set_option(ld, LDAP_OPT_PROTOCOL_VERSION,
                       &protoversion) != LDAP_OPT_SUCCESS)
               {
                       /* this will enter emergency mode */
                       sgLogFatalError("%s: ldap_set_option failed: %s",
                               progname, ldap_err2string(get_ldap_errno(ld)));
               }
       }

       /*
        * Set binddn and bindpass with values from the config
        * file. Do this before the URL extentions so that they
        * override on a per-block basis.
        */
       binddn = sgSettingGetValue("ldapbinddn");
       bindpass = sgSettingGetValue("ldapbindpass");

       /* check for supported URL extensions:
        *    bindname=<binddn>      (RFC2255)
        *    x-bindpass=<bindpass>  (user-specific, allowed by RFC2255)
        */
       for(ext_i = 0;
           lud->lud_exts != NULL && lud->lud_exts[ext_i] != NULL;
           ext_i++) {

               char *key = lud->lud_exts[ext_i];
               char *data;

               /* skip over any 'critical' markers */
               if (*key == '!')
                       key++;

               /* find '=' sign (first one is all we care about) */
               data = strchr(key, '=');
               if (data == NULL)
                       continue;       /* invalid extension, skip */
               data++;             /* good extension, get data */

               /* do we recognize the key? */
               if (strncmp(key, "bindname=", 9) == 0)
               {
                       binddn = data;
                        sgLogError("Extracted binddn: %s", binddn); 
               }
               else if (strncmp(key, "x-bindpass=", 11) == 0)
               {
                       bindpass = data;
                        sgLogError("Extracted x-bindpass: %s", bindpass); 
               }
       }

       /* authenticate to the directory */
       if (ldap_simple_bind_s(ld, binddn, bindpass) != LDAP_SUCCESS) {
               sgLogError("%s: ldap_simple_bind_s failed: %s", progname,
               ldap_err2string(get_ldap_errno(ld)));
               ldap_unbind(ld);
               ldap_free_urldesc(lud);
               return found;
       }

       /* Perform search */
       if(ldap_search_ext_s(ld, lud->lud_dn, lud->lud_scope, lud->lud_filter,
               lud->lud_attrs, 0, NULL, NULL, NULL, -1,
               &ldapresult) != LDAP_SUCCESS) {


               sgLogError("%s: ldap_search_ext_s failed: %s "

                       "(params: %s, %d, %s, %s)",
                       progname, ldap_err2string(get_ldap_errno(ld)),
                       lud->lud_dn, lud->lud_scope, lud->lud_filter,
                       lud->lud_attrs[0]);


               ldap_unbind(ld);
               ldap_free_urldesc(lud);
               return found;
       }

       /* return hash */
       ldapentry = ldap_first_entry(ld, ldapresult);
       if(ldapentry != NULL) {
               /* Use first attribute to get value */
               ldapvals = ldap_get_values(ld, ldapentry, lud->lud_attrs[0]);
               if(ldapvals != NULL) {
                       if(*ldapvals != NULL)
                               found = 1;
                       ldap_value_free(ldapvals);
               }
       }

       /* cleanup */
       ldap_msgfree(ldapresult);
       ldap_unbind(ld);
       ldap_free_urldesc(lud);
       return found;
}

#endif

