Reproducible paper template
===========================

This project contains a **fully working template** for a high-level
research reproduction pipeline, or reproducible paper, as defined in the
link below. If the link below is not accessible at the time of reading,
please see the appendix at the end of this file for a portion of its
introduction. Some [slides](http://akhlaghi.org/pdf/reproducible-paper.pdf)
are also available to help demonstrate the concept implemented here.

  http://akhlaghi.org/reproducible-science.html

This template is created with the aim of supporting reproducible research
by making it easy to start a project in this framework. As shown below, it
is very easy to customize this template reproducible paper pipeline for any
particular research/job and expand it as it starts and evolves. It can be
run with no modification (as described in `README.md`) as a demonstration
and customized for use in any project as fully described below.

The pipeline will download and build all the necessary libraries and
programs for working in a closed environment (highly independent of the
host operating system) with fixed versions of the necessary
dependencies. The tarballs for building the local environment are also
collected in a [separate
repository](https://gitlab.com/makhlaghi/reproducible-paper-dependencies). The
[final reproducible paper
output](https://gitlab.com/makhlaghi/reproducible-paper-output/raw/master/paper.pdf)
of this pipeline is also present in [a separate
repository](https://gitlab.com/makhlaghi/reproducible-paper-output). Notice
the last paragraph of the Acknowledgments where all the dependencies are
mentioned with their versions.

Below, we start with a discussion of why Make was chosen as the high-level
language/framework for this research reproduction pipeline and how to learn
and master Make easily (and freely). The general architecture and design of
the pipeline is then discussed to help you navigate the files and their
contents. This is followed by a checklist for the easy/fast customization
of this pipeline to your exciting research. We continue with some tips and
guidelines on how to manage or extend the pipeline as your research grows
based on our experiences with it so far. The main body concludes with a
description of possible future improvements that are planned for the
pipeline (but not yet implemented). As discussed above, we end with a short
introduction on the necessity of reproducible science in the appendix.

Please don't forget to share your thoughts, suggestions and criticisms on
this pipeline. Maintaining and designing this pipeline is itself a separate
project, so please join us if you are interested. Once it is mature enough,
we will describe it in a paper (written by all contributors) for a formal
introduction to the community.





Why Make?
---------

When batch processing is necessary (no manual intervention, as in a
reproduction pipeline), shell scripts are usually the first solution that
come to mind. However, the inherent complexity and non-linearity of
progress in a scientific project (where experimentation is key) make it
hard to manage the script(s) as the project evolves. For example, a script
will start from the top/start every time it is run. So if you have already
completed 90% of a research project and want to run the remaining 10% that
you have newly added, you have to run the whole script from the start
again. Only then will you see the effects of the last new steps (to find
possible errors, or better solutions and etc).

It is possible to manually ignore/comment parts of a script to only do a
special part. However, such checks/comments will only add to the complexity
of the script and will discourage you to play-with/change an already
completed part of the project when an idea suddenly comes up. It is also
prone to very serious bugs in the end (when trying to reproduce from
scratch). Such bugs are very hard to notice during the work and frustrating
to find in the end.

The Make paradigm, on the other hand, starts from the end: the final
*target*. It builds a dependency tree internally, and finds where it should
start each time the pipeline is run. Therefore, in the scenario above, a
researcher that has just added the final 10% of steps of her research to
her Makefile, will only have to run those extra steps. With Make, it is
also trivial to change the processing of any intermediate (already written)
*rule* (or step) in the middle of an already written analysis: the next
time Make is run, only rules that are affected by the changes/additions
will be re-run, not the whole analysis/pipeline.

This greatly speeds up the processing (enabling creative changes), while
keeping all the dependencies clearly documented (as part of the Make
language), and most importantly, enabling full reproducibility from scratch
with no changes in the pipeline code that was working during the
research. This will allow robust results and let the scientists get to what
they do best: experiment and be critical to the methods/analysis without
having to waste energy and time on technical problems that come up as a
result of that experimentation in scripts.

Since the dependencies are clearly demarcated in Make, it can identify
independent steps and run them in parallel. This further speeds up the
processing. Make was designed for this purpose. It is how huge projects
like all Unix-like operating systems (including GNU/Linux or Mac OS
operating systems) and their core components are built. Therefore, Make is
a highly mature paradigm/system with robust and highly efficient
implementations in various operating systems perfectly suited for a complex
non-linear research project.

Make is a small language with the aim of defining *rules* containing
*targets*, *prerequisites* and *recipes*. It comes with some nice features
like functions or automatic-variables to greatly facilitate the management
of text (filenames for example) or any of those constructs. For a more
detailed (yet still general) introduction see the article on Wikipedia:

  https://en.wikipedia.org/wiki/Make_(software)

Make is a +40 year old software that is still evolving, therefore many
implementations of Make exist. The only difference in them is some extra
features over the [standard
definition](https://pubs.opengroup.org/onlinepubs/009695399/utilities/make.html)
(which is shared in all of them). This pipeline has been created for GNU
Make which is the most common, most actively developed, and most advanced
implementation. Just note that this pipeline downloads, builds, internally
installs, and uses its own dependencies (including GNU Make), so you don't
have to have it installed before you try it out.





How can I learn Make?
---------------------

The GNU Make book/manual (links below) is arguably the best place to learn
Make. It is an excellent and non-technical book to help get started (it is
only non-technical in its first few chapters to get you started easily). It
is freely available and always up to date with the current GNU Make
release. It also clearly explains which features are specific to GNU Make
and which are general in all implementations. So the first few chapters
regarding the generalities are useful for all implementations.

The first link below points to the GNU Make manual in various formats and
in the second, you can download it in PDF (which may be easier for a first
time reading).

  https://www.gnu.org/software/make/manual/

  https://www.gnu.org/software/make/manual/make.pdf

If you use GNU Make, you also have the whole GNU Make manual on the
command-line with the following command (you can come out of the "Info"
environment by pressing `q`).

```shell
  $ info make
```

If you aren't familiar with the Info documentation format, we strongly
recommend running `$ info info` and reading along. In less than an hour,
you will become highly proficient in it (it is very simple and has a great
manual for itself). Info greatly simplifies your access (without taking
your hands off the keyboard!) to many manuals that are installed on your
system, allowing you to be much more efficient as you work. If you use the
GNU Emacs text editor (or any of its variants), you also have access to all
Info manuals while you are writing your projects (again, without taking
your hands off the keyboard!).





Published works using this pipeline
-----------------------------------

The links below will guide you to some of the works that have already been
published using the method of this pipeline. Note that this pipeline is
evolving, so some small details may be different in them, but they can be
used as a good working model to build your own.

 - Section 7.3 of Bacon et
   al. ([2017](http://adsabs.harvard.edu/abs/2017A%26A...608A...1B), A&A
   608, A1): The version controlled reproduction pipeline is available [on
   Gitlab](https://gitlab.com/makhlaghi/muse-udf-origin-only-hst-magnitudes)
   and a snapshot of the pipeline along with all the necessary input
   datasets and outputs is available in
   [zenodo.1164774](https://doi.org/10.5281/zenodo.1164774).

 - Section 4 of Bacon et
   al. ([2017](http://adsabs.harvard.edu/abs/2017A%26A...608A...1B), A&A,
   608, A1): The version controlled reproduction pipeline is available [on
   Gitlab](https://gitlab.com/makhlaghi/muse-udf-photometry-astrometry) and
   a snapshot of the pipeline along with all the necessary input datasets
   is available in
   [zenodo.1163746](https://doi.org/10.5281/zenodo.1163746).

 - Akhlaghi & Ichikawa
   ([2015](http://adsabs.harvard.edu/abs/2015ApJS..220....1A), ApJS, 220,
   1): The version controlled reproduction pipeline is available [on
   Gitlab](https://gitlab.com/makhlaghi/NoiseChisel-paper). This is the
   very first (and much less mature) implementation of this pipeline: the
   history of this template pipeline started more than two years after that
   paper was published. It is a very rudimentary/initial implementation,
   thus it is only included here for historical reasons. However, the
   pipeline is complete and accurate and uploaded to arXiv along with the
   paper. See the more recent implementations if you want to get ideas for
   your version of this pipeline.





Citation
--------

A paper will be published to fully describe this reproduction
pipeline. Until then, if this pipeline is useful in your work, please cite
the paper that implemented the first version of this pipeline: Akhlaghi &
Ichikawa ([2015](http://adsabs.harvard.edu/abs/2015ApJS..220....1A), ApJS,
220, 1).

The experience gained with this template after several more implementations
will be used to make this pipeline robust enough for a complete and useful
paper to introduce to the community afterwards.

Also, when your paper is published, don't forget to add a notice in your
own paper (in coordination with the publishing editor) that the paper is
fully reproducible and possibly add a sentence or paragraph in the end of
the paper shortly describing the concept. This will help spread the word
and encourage other scientists to also publish their reproduction
pipelines.










Reproduction pipeline architecture
==================================

In order to adopt this pipeline to your research, it is important to first
understand its architecture so you can navigate your way in the directories
and understand how to implement your research project within its
framework. But before reading this theoretical discussion, please run the
pipeline (described in `README.md`: first run `./configure`, then
`.local/bin/make -j8`) without any change, just to see how it works.

In order to obtain a reproducible result it is important to have an
identical environment (for example same versions of the programs that it
will use). Therefore, the pipeline builds its own dependencies during the
`./configure` step. Building of the dependencies is managed by
`reproduce/src/make/dependencies-basic.mk` and
`reproduce/src/make/dependencies.mk`. These Makefiles are called by the
`./configure` script and not used afterwards. The first is intended for
downloading and building the most basic tools like GNU Bash, GNU Make, and
GNU Tar. Therefore it must only contain very basic and portable Make and
shell features. The second is called after the first, thus enabling usage
of the modern and advanced features of GNU Bash and GNU Make, similar to
the rest of the pipeline. Later, if you add a new program/library for your
research, you will need to include a rule on how to download and build it
(in `reproduce/src/make/dependencies.mk`).

After it finishes, `./configure` will create a `Makefile` in the top
directory (a symbolic link to `reproduce/src/make/top.mk`) and a `.local`
directory (a link for easy access to the custom built software
packages). The `.local/bin/make` command will then use our custom version
of GNU Make to do the analysis. The first file that is read by Make is the
top-level `Makefile`. Therefore, we'll start our navigation/discussion with
this file. This file is relatively short and heavily commented so hopefully
the descriptions in each comment will be enough to understand the general
details. As you read this section, please also look at the contents of the
mentioned files and directories to fully understand what is going on.

Before starting to look into the top `Makefile`, it is important to recall
that Make defines dependencies by files. Therefore, the input/prerequisite
and output of every step/rule must be a file. Also recall that Make will
use the modification date of the prerequisite and target files to see if
the target must be re-built or not. Therefore during the processing, _many_
intermediate files will be created (see the tips section below on a good
strategy to deal with large/huge files).

To keep the source and (intermediate) built files separate, you _must_
define a top-level build directory variable (or `$(BDIR)`) to host all the
intermediate files (it was defined in `./configure`). This directory
doesn't need to be version controlled or even synchronized, or backed-up in
other servers: its contents are all products of the pipeline, and can be
easily re-created any time. As you define targets for your new rules, it is
thus important to place them all under sub-directories of `$(BDIR)`.

In this architecture, we have two types of Makefiles that are loaded into
the top `Makefile`: _configuration-Makefiles_ (only independent
variables/configurations) and _workhorse-Makefiles_ (Makefiles that
actually contain rules).

The configuration-Makefiles are those that satisfy this wildcard:
`reproduce/config/pipeline/*.mk`. These Makefiles don't actually have any
rules, they just have values for various free parameters throughout the
analysis/processing. Open a few of them to see for your self. These
Makefiles must only contain raw Make variables (pipeline
configurations). By raw we mean that the Make variables in these files must
not depend on variables in any other configuration-Makefile. This is
because we don't want to assume any order in reading them. It is also very
important to *not* define any rule, or other Make construct in any of these
configuration-Makefiles.

These conditions will enable you to set these configure-Makefiles as a
prerequisite to any target that depends on their variable
values. Therefore, if you change any of their values, all targets that
depend on those values will be re-built. This is very convenient as your
project scales up and gets more complex.

The workhorse-Makefiles are those satisfying this wildcard
`reproduce/src/make/*.mk`. They contain the details of the processing steps
(Makefiles containing rules). Therefore, in this phase *order is
important*, because the prerequisites of most rules will be the targets of
other rules that will be defined prior to them (not a fixed name like
`paper.pdf`). The lower-level rules must be imported into Make before the
higher-level ones.

All processing steps are assumed to ultimately (usually after many rules)
end up in some number, image, figure, or table that are to be included in
the paper. The writing of these results into the final report/paper is
managed through separate LaTeX files that only contain macros (a name given
to a number/string to be used in the LaTeX source, which will be replaced
when compiling it to the final PDF). So the last target in a
workhorse-Makefile is a `.tex` file (with the same base-name as the
Makefile, but in `$(BDIR)/tex/macros`). As a result, if the targets in a
workhorse-Makefile aren't directly a prerequisite of other
workhorse-Makefile targets, they can be a pre-requisite of that
intermediate LaTeX macro file and thus be called when necessary. Otherwise,
they will be ignored by Make.

This pipeline also has a mode to share the build directory between several
users of a Unix group (when working on large computer clusters). In this
scenario, each user can have their own cloned pipeline source, but share
the large built files between each other. To do this, it is necessary for
all built files to give full permission to group members while not allowing
any other users access to the contents. Therefore the `./configure` and
Make steps must be called with special conditions which are managed in the
`for-group` file.

Let's see how this design is implemented. When the `./configure` finishes,
it makes a `Makefile` in the top directory. This Makefile is just a
symbolic link to `reproduce/src/make/top.mk`. Please open and inspect it as
we go along here. The first step (un-commented line) is to import the local
configuration (answers to the questions `./configure` asked you). They are
defined in the configuration-Makefile `reproduce/config/pipeline/LOCAL.mk`
which was also built by `./configure` (based on the `LOCAL.mk.in`
template).

The next non-commented set of lines define the ultimate target of the whole
pipeline (`paper.pdf`). But a sanity check is necessary for situations when
the user is not careful (for example has configured the pipeline for group
access but forgets to run the pipeline with `./for-group`, or the
opposite). Therefore we use a Make conditional to define the `all` target
based on the group permissions being consistent between the initial
configuration and the current run.

If there is a problem `all` will not depend on anything and will just print
a warning to inform you of the problem. When the group conditions are fine,
`all` will depend on `paper.pdf` (which is defined in
`reproduce/src/make/paper.mk` and will be imported into this top Makefile
later).

Having defined the top target, our next step is to include all the other
necessary Makefiles. But order matters in the importing of
workhorse-Makefiles and each must also have a TeX macro file with the same
base name (without a suffix). Therefore, the next step in the top-level
Makefile is to define a `makesrc` variable to keep the base names (without
a `.mk` suffix) of the workhorse-Makefiles that must be imported, in the
proper order.

Finally, we'll just import all the configuration-Makefiles with a wildcard
(while ignoring `LOCAL.mk` that was imported before). Also, all
workhorse-Makefiles are imported in the proper order using a Make `foreach`
loop. This finishes the general view of the pipeline's implementation.

In short, to keep things modular, readable and managable, follow these
recommendations: 1) Set clear-to-understand names for the
configuration-Makefiles, and workhorse-Makefiles, 2) Only import other
Makefiles from top Makefile. These will let you know/remember generally
which step you are taking before or after another. Projects will scale up
very fast. Thus if you don't start and continue with a clean and robust
convention like this, in the end it will become very dirty and hard to
manage/understand (even for yourself). As a general rule of thumb, break
your rules into as many logically-similar but independent steps as
possible.

The `reproduce/src/make/paper.mk` Makefile must be the final Makefile that
is included. It ends with the rule to build `paper.pdf` (final target of
the whole reproduction pipeline). If look in it, you will notice that it
starts with a rule to create `tex/pipeline.tex`. `tex/pipeline.tex` is the
connection between the processing/analysis steps of the pipeline, and the
steps to build the final PDF. As you see, `tex/pipeline.tex` is only a
merging/concatenation of LaTeX macros defined as the output of each
high-level processing step (the separate work-horse Makefiles that you
included).

One of the LaTeX macros created by `reproduce/src/make/initialize.mk` is
`\bdir`. It is the location of the build directory. In some cases you want
tables and images to also be included in the final PDF. To keep these
necessary LaTeX inputs, you can define other directories under
`$(BDIR)/tex` in the relevant workhorse-Makefile. You can then easily guide
LaTeX to look into the proper directory to import an image for example
through the `\bdir` macro.

During the research, it often happens that you want to test a step that is
not a prerequisite of any higher-level operation. In such cases, you can
(temporarily) define that processing as a rule in the most relevant
workhorse-Makefile and set its target as a prerequisite of its TeX
macro. If your test gives a promising result and you want to include it in
your research, set it as prerequisites to other rules and remove it from
the list of prerequisites for TeX macro file. In fact, this is how a
project is designed to grow in this framework.

When working within a group, more than one person may want to work with the
pipeline outputs (in the build directory). For example each person is
developing part of the higher-level steps of the pipeline in their own Git
branch of the pipeline, but using the same build directory. Therefore, the
lower-level parts of the built outputs, can be shared between them. In such
scenarios, this pipeline comes with a `for-group` script (in the top
directory) which is just a simple wrapper to run the configure and building
steps. You can specify a group name within this file. Therefore, when you
use it (fully described in the comments at the start of the file), it will
ensure that all group members have write access to the created files.




Summary
-------

Based on the explanation above, some major design points you should have in
mind are listed below.

 - Define new `reproduce/src/make/XXXXXX.mk` workhorse-Makefile(s) with
   good and human-friendly name(s) replacing `XXXXXX`.

 - Add `XXXXXX`, as a new line, to the values in `makesrc` of the top-level
   `Makefile`.

 - Do not use any constant numbers (or important names like filter names)
   in the workhorse-Makefiles or paper's LaTeX source. Define such
   constants as logically-grouped, separate configuration-Makefiles in
   `reproduce/config/pipeline`. Then set the respective
   configuration-Makefiles file as a pre-requisite to any rule that uses
   the variable defined in it.

 - Through any number of intermediate prerequisites, all processing steps
   should end in (be a prerequisite of) `tex/pipeline.tex` (defined in
   `reproduce/src/make/paper.mk`). `tex/pipeline.tex` is the bridge between
   the processing steps and PDF-building steps.










Checklist to customize the pipeline
===================================

Take the following steps to fully customize this pipeline for your research
project. After finishing the list, be sure to run `./configure` and `make`
to see if everything works correctly before expanding it. If you notice
anything missing or any in-correct part (probably a change that has not
been explained here), please let us know to correct it.

As described above, the concept of a reproduction pipeline heavily relies
on [version
control](https://en.wikipedia.org/wiki/Version_control). Currently this
pipeline uses Git as its main version control system. If you are not already
familiar with Git, please read the first three chapters of the [ProGit
book](https://git-scm.com/book/en/v2) which provides a wonderful practical
understanding of the basics. You can read later chapters as you get more
advanced in later stages of your work.

 - **Get this repository and its history** (if you don't already have it):
     Arguably the easiest way to start is to clone this repository as shown
     below. The main branch of this pipeline is called `pipeline`. This
     allows you to use the common branch name `master` for your own
     research, while keeping up to date with improvements in the pipeline.

     ```shell
     $ git clone https://gitlab.com/makhlaghi/reproducible-paper.git
     $ mv reproducible-paper my-project-name      # Your own directory name.
     $ cd my-project-name                         # Go into the cloned directory.
     $ git tag | xargs git tag -d                 # Delete all pipeline tags.
     $ git config remote.origin.tagopt --no-tags  # No tags in future fetch/pull from this pipeline.
     $ git remote rename origin pipeline-origin   # Rename the pipeline's remote.
     $ git checkout -b master                     # Create, enter master branch.
     ```

 - **Test the pipeline**: Before making any changes, it is important to
     test the pipeline and see if everything works properly with the
     commands below. If there is any problem in the `./configure` or `make`
     steps, please contact us to fix the problem before continuing. Since
     the building of dependencies in `./configure` can take long, you can
     take the next few steps (editing the files) while its working (they
     don't affect the configuration). After `make` is finished, open
     `paper.pdf` and if it looks fine, you are ready to start customizing
     the pipeline for your project. But before that, clean all the extra
     pipeline outputs with `make clean` as shown below.

     ```shell
     $ ./configure              # Set top directories and build dependencies.
     $ .local/bin/make          # Run the pipeline.

     # Open 'paper.pdf' and see if everything is ok.
     $ .local/bin/make clean    # Delete high-level outputs.
     ```

 - **Setup the remote**: You can use any [hosting
     facility](https://en.wikipedia.org/wiki/Comparison_of_source_code_hosting_facilities)
     that supports Git to keep an online copy of your project's version
     controlled history. We recommend [GitLab](https://gitlab.com) because
     it allows any number of private repositories for free and because you
     can host GitLab on your own server. Create an account in your favorite
     hosting facility (if you don't already have one), and define a new
     project there. It will give you a link (ending in `.git`) that you can
     put in place of `XXXXXXXXXX` in the command below.

     ```shell
     git remote add origin XXXXXXXXXX
     ```

 - **Copyright**, **name** and **date**: Go over the existing scripting
     files and add your name and email to the copyright notice. You can
     find the files by searching for the placeholder email
     `your@email.address` (which you should change) with the command below
     (you can ignore this file, and any in the `tex/` directory). Don't
     forget to add your name after the copyright year also. When making new
     files, always remember to add a similar copyright statement at the top
     of the file and also ask your colleagues to do so when they edit a
     file. This is very important.

     ```shell
     $ grep -r your@email.address ./*
     ```

 - **Title**, **short description** and **author** in source files: In this
     raw skeleton, the title or short description of your project should be
     added in the following two files: `reproduce/src/make/top.mk` (the
     first line), and `tex/preamble-header.tex`. In both cases, the texts
     you should replace are all in capital letters to make them easier to
     identify. Of course, if you use a different LaTeX method of managing
     the title and authors, please feel free to use your own methods after
     finishing this checklist and doing your first commit.

 - **Gnuastro**: GNU Astronomy Utilities (Gnuastro) is currently a
     dependency of the pipeline which will be built and used. The main
     reason for this is to demonstrate how critically important it is to
     version your scientific tools. If you don't need Gnuastro for your
     research, you can simply remove the parts enclosed in marked parts in
     the relevant files of the list below. The marks are comments, which
     you can find by searching for "Gnuastro". If you will be using
     Gnuastro, then remove the commented marks and keep the code within
     them.

   - Delete marked part(s) in `configure`.
   - Delete the `reproduce/config/gnuastro` directory.
   - Delete `astnoisechisel` from the value of `top-level-programs` in `reproduce/src/make/dependencies.mk`. You can keep the rule to build `astnoisechisel`, since its not in the `top-level-programs` list, it (and all the dependencies that are only needed by Gnuastro) will be ignored.
   - Delete marked parts in `reproduce/src/make/initialize.mk`.

 - **Other dependencies**: If there are any more of the dependencies that
     you don't use (or others that you need), then remove (or add) them in
     the respective parts of `reproduce/src/make/dependencies.mk`. It is
     commented thoroughly and reading over the comments should guide you on
     what to add/remove and where.

 - **Input dataset (can be done later)**: The input datasets are managed
     through the `reproduce/config/pipeline/INPUTS.mk` file. It is best to
     gather all the information regarding all the input datasets into this
     one central file. To ensure that the proper dataset is being
     downloaded and used by the pipeline, it is also recommended get an
     [MD5 checksum](https://en.wikipedia.org/wiki/MD5) of the file and
     include that in `INPUTS.mk` so you can check it in the pipeline. The
     preparation of the input datasets is done in
     `reproduce/src/make/download.mk`. Have a look there to see how these
     values are to be used. This information about the input datasets is
     also used in the initial `configure` script (to inform the users), so
     also modify that file. You can find all occurrences of the template
     dataset with the command below and replace it with your input's
     dataset.

     ```shell
     $ grep -ir wfpc2 ./*
     ```

 - **Delete dummy parts (can be done later)**: The template pipeline
     contains some parts that are only for the initial/test run, mainly as
     a demonstration of important steps. They not for any real
     analysis. You can remove these parts in the file below

     - `paper.tex`: Delete the text of the abstract and the paper's main
       body, *except* the "Acknowledgments" section. This reproduction
       pipeline was designed by funding from many grants, so its necessary
       to acknowledge them in your final research.

     - `Makefile`: Delete the lines containing `delete-me` in the `foreach`
       loop. Just make sure the other lines that end in `\` are immediately
       after each other (except the last line).

     - Delete all `delete-me*` files in the following directories:

       ```shell
       $ rm tex/delete-me*
       $ rm reproduce/src/make/delete-me*
       $ rm reproduce/config/pipeline/delete-me*
       ```

 - **`README.md`**: Correct all the `XXXXX` place holders (name of your
     project, your own name, address of pipeline's online/remote
     repository, link to download dependencies and etc). Generally, read
     over the text and update it where necessary to fit your project. Don't
     forget that this is the first file that is displayed on your online
     repository and also your colleagues will first be drawn to read this
     file. Therefore, make it as easy as possible for them to start
     with. Also check and update this file one last time when you are ready
     to publish your work (and its reproduction pipeline).

 - **`for-group`**: If you will be working on this pipeline with
     colleagues, and the build steps involve many files, or are slow, you
     need to share the build directory. This script is designed for such
     scenarios. So open this file and give the name of the Unix name of
     your group to the `thisgroup` variable. You can see the list of groups
     you are a member of with the `groups` command. You can ask your system
     administrator to define a group with specific members if necessary.

 - **Your first commit**: You have already made some small and basic
     changes in the steps above and you are in the `master` branch. So, you
     can officially make your first commit in your project's history. But
     before that you need to make sure that there are no problems in the
     pipeline (this is a good habit to always re-build the system before a
     commit to be sure it works as expected).

     ```shell
     $ .local/bin/make clean      # Delete outputs ('make distclean' for everything)
     $ .local/bin/make            # Build the pipeline to ensure everything is fine.
     $ git add -u                 # Stage all the changes.
     $ git status                 # Make sure everything is fine.
     $ git commit                 # Your first commit, add a nice description.
     $ git tag -a v0              # Tag this as the zero-th version of your pipeline.
     ```

 - **Push to the remote**: Push your first commit and its tag to the remote
     repository with these commands:

     ```shell
     git push -u origin --all
     git push -u origin --tags
     ```

 - **Start your exciting research**: You are now ready to add flesh and
     blood to this raw skeleton by further modifying and adding your
     exciting research steps. You can use the "published works" section in
     the introduction (above) as some fully working models to learn
     from. Also, don't hesitate to contact us if you have any
     questions. Any time you are ready to push your commits to the remote
     repository, you can simply use `git push`.

 - **Feedback**: As you use the pipeline you will notice many things that
     if implemented from the start would have been very useful for your
     work. This can be in the actual scripting and architecture of the
     pipeline or in useful implementation and usage tips, like those
     below. In any case, please share your thoughts and suggestions with
     us, so we can add them here for everyone's benefit.

 - **Keep pipeline up-to-date**: In time, this pipeline is going to become
     more and more mature and robust (thanks to your feedback and the
     feedback of other users). Bugs will be fixed and new/improved features
     will be added. So every once and a while, you can run the commands
     below to pull new work that is done in this pipeline. If the changes
     are useful for your work, you can merge them with your own customized
     pipeline to benefit from them. Just pay **very close attention** to
     resolving possible **conflicts** which might happen in the merge
     (updated general pipeline settings that you have customized).

     ```shell
     $ git checkout pipeline
     $ git pull pipeline-origin pipeline   # Get recent work in this pipeline.
     $ git log XXXXXX..XXXXXX --reverse    # Inspect new work (replace XXXXXXs with hashs mentioned in output of previous command).
     $ git log --oneline --graph --decorate --all # General view of branches.
     $ git checkout master                 # Go to your top working branch.
     $ git merge pipeline                  # Import all the work into master.
     ```

 - **Pre-publication: add notice on reproducibility**: Add a notice
     somewhere prominent in the first page within your paper, informing the
     reader that your research is fully reproducible. For example in the
     end of the abstract, or under the keywords with a title like
     "reproducible paper". This will encourage them to publish their own
     works in this manner also and also will help spread the word.








Usage tips: designing your pipeline/workflow
============================================

The following is a list of design points, tips, or recommendations that
have been learned after some experience with this pipeline. Please don't
hesitate to share any experience you gain after using this pipeline with
us. In this way, we can add it here for the benefit of others.

 - **Modularity**: Modularity is the key to easy and clean growth of a
     project. So it is always best to break up a job into as many
     sub-components as reasonable. Here are some tips to stay modular.

   - *Short recipes*: if you see the recipe of a rule becoming more than a
      handful of lines which involve significant processing, it is probably
      a good sign that you should break up the rule into its main
      components. Try to only have one major processing step per rule.

   - *Context-based (many) Makefiles*: This pipeline is designed to allow
      the easy inclusion of many Makefiles (in `reproduce/src/make/*.mk`)
      for maximal modularity. So keep the rules for closely related parts
      of the processing in separate Makefiles.

   - *Descriptive names*: Be very clear and descriptive with the naming of
      the files and the variables because a few months after the
      processing, it will be very hard to remember what each one was
      for. Also this helps others (your collaborators or other people
      reading the pipeline after it is published) to more easily understand
      your work and find their way around.

   - *Naming convention*: As the project grows, following a single standard
      or convention in naming the files is very useful. Try best to use
      multiple word filenames for anything that is non-trivial (separating
      the words with a `-`). For example if you have a Makefile for
      creating a catalog and another two for processing it under models A
      and B, you can name them like this: `catalog-create.mk`,
      `catalog-model-a.mk` and `catalog-model-b.mk`. In this way, when
      listing the contents of `reproduce/src/make` to see all the
      Makefiles, those related to the catalog will all be close to each
      other and thus easily found. This also helps in auto-completions by
      the shell or text editors like Emacs.

   - *Source directories*: If you need to add files in other languages for
      example in shell, Python, AWK or C, keep them in a separate directory
      under `reproduce/src`, with the appropriate name.

   - *Configuration files*: If your research uses special programs as part
      of the processing, put all their configuration files in a devoted
      directory (with the program's name) within
      `reproduce/config`. Similar to the `reproduce/config/gnuastro`
      directory (which is put in the template as a demo in case you use GNU
      Astronomy Utilities). It is much cleaner and readable (thus less
      buggy) to avoid mixing the configuration files, even if there is no
      technical necessity.


 - **Contents**: It is good practice to follow the following
     recommendations on the contents of your files, whether they are source
     code for a program, Makefiles, scripts or configuration files
     (copyrights aren't necessary for the latter).

   - *Copyright*: Always start a file containing programming constructs
      with a copyright statement like the ones that this template starts
      with (for example in the top level `Makefile`).

   - *Comments*: Comments are vital for readability (by yourself in two
      months, or others). Describe everything you can about why you are
      doing something, how you are doing it, and what you expect the result
      to be. Write the comments as if it was what you would say to describe
      the variable, recipe or rule to a friend sitting beside you. When
      writing the pipeline it is very tempting to just steam ahead with
      commands and codes, but be patient and write comments before the
      rules or recipes. This will also allow you to think more about what
      you should be doing. Also, in several months when you come back to
      the code, you will appreciate the effort of writing them. Just don't
      forget to also read and update the comment first if you later want to
      make changes to the code (variable, recipe or rule). As a general
      rule of thumb: first the comments, then the code.

   - *File title*: In general, it is good practice to start all files with
      a single line description of what that particular file does. If
      further information about the totality of the file is necessary, add
      it after a blank line. This will help a fast inspection where you
      don't care about the details, but just want to remember/see what that
      file is (generally) for. This information must of course be commented
      (its for a human), but this is kept separate from the general
      recommendation on comments, because this is a comment for the whole
      file, not each step within it.


 - **Make programming**: Here are some experiences that we have come to
     learn over the years in using Make and are useful/handy in research
     contexts.

   - *Automatic variables*: These are wonderful and very useful Make
      constructs that greatly shrink the text, while helping in
      read-ability, robustness (less bugs in typos for example) and
      generalization. For example even when a rule only has one target or
      one prerequisite, always use `$@` instead of the target's name, `$<`
      instead of the first prerequisite, `$^` instead of the full list of
      prerequisites and etc. You can see the full list of automatic
      variables
      [here](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html). If
      you use GNU Make, you can also see this page on your command-line:

        ```shell
        $ info make "automatic variables"
        ```

   - *Debug*: Since Make doesn't follow the common top-down paradigm, it
      can be a little hard to get accustomed to why you get an error or
      un-expected behavior. In such cases, run Make with the `-d`
      option. With this option, Make prints a full list of exactly which
      prerequisites are being checked for which targets. Looking
      (patiently) through this output and searching for the faulty
      file/step will clearly show you any mistake you might have made in
      defining the targets or prerequisites.

   - *Large files*: If you are dealing with very large files (thus having
      multiple copies of them for intermediate steps is not possible), one
      solution is the following strategy. Set a small plain text file as
      the actual target and delete the large file when it is no longer
      needed by the pipeline (in the last rule that needs it). Below is a
      simple demonstration of doing this, where we use Gnuastro's
      Arithmetic program to add all pixels of the input image with 2 and
      create `large1.fits`. We then subtract 2 from `large1.fits` to create
      `large2.fits` and delete `large1.fits` in the same rule (when its no
      longer needed). We can later do the same with `large2.fits` when it
      is no longer needed and so on.
        ```
        large1.fits.txt: input.fits
                astarithmetic $< 2 + --output=$(subst .txt,,$@)
                echo "done" > $@
        large2.fits.txt: large1.fits.txt
                astarithmetic $(subst .txt,,$<) 2 - --output=$(subst .txt,,$@)
                rm $(subst .txt,,$<)
                echo "done" > $@
        ```
     A more advanced Make programmer will use Make's [call
     function](https://www.gnu.org/software/make/manual/html_node/Call-Function.html)
     to define a wrapper in `reproduce/src/make/initialize.mk`. This
     wrapper will replace `$(subst .txt,,XXXXX)`. Therefore, it will be
     possible to greatly simplify this repetitive statement and make the
     code even more readable throughout the whole pipeline.


 - **Dependencies**: It is critically important to exactly document, keep
   and check the versions of the programs you are using in the pipeline.

   - *Check versions*: In `reproduce/src/make/initialize.mk`, check the
      versions of the programs you are using.

   - *Keep the source tarball of dependencies*: keep a tarball of the
      necessary version of all your dependencies (and also a copy of the
      higher-level libraries they depend on). Software evolves very fast
      and only in a few years, a feature might be changed or removed from
      the mainstream version or the software server might go down. To be
      safe, keep a copy of the tarballs. Software tarballs are rarely over
      a few megabytes, very insignificant compared to the data. If you
      intend to release the pipeline in a place like Zenodo, then you can
      create your submission early (before public release) and upload/keep
      all the necessary tarballs (and data)
      there. [zenodo.1163746](https://doi.org/10.5281/zenodo.1163746) is
      one example of how the data, Gnuastro (main software used) and all
      major Gnuastro's dependencies have been uploaded with the pipeline.

   - *Keep your input data*: The input data is also critical to the
      pipeline, so like the above for software, make sure you have a backup
      of them.

 - **Version control**: It is important (and extremely useful) to have the
   history of your pipeline under version control. So try to make commits
   regularly (after any meaningful change/step/result), while not
   forgetting the following notes.

   - *Tags*: To help manage the history, tag all major commits. This helps
      make a more human-friendly output of `git describe`: for example
      `v1-4-gaafdb04` states that we are on commit `aafdb04` which is 4
      commits after tag `v1`. The output of `git describe` is included in
      your final PDF as part of this pipeline. Also, if you use
      reproducibility-friendly software like Gnuastro, this value will also
      be included in all output files, see the description of `COMMIT` in
      [Output
      headers](https://www.gnu.org/software/gnuastro/manual/html_node/Output-headers.html).
      In the checklist above, we tagged the first commit of your pipeline
      with `v0`. Here is one suggestion on when to tag: when you have fully
      adopted the pipeline and have got the first (initial) results, you
      can make a `v1` tag. Subsequently when you first start reporting the
      results to your colleagues, you can tag the commit as `v2`. Afterwards
      when you submit to a paper, it can be tagged `v3` and so on.

   - *Pipeline outputs*: During your research, it is possible to checkout a
      specific commit and reproduce its results. However, the processing
      can be time consuming. Therefore, it is useful to also keep track of
      the final outputs of your pipeline (at minimum, the paper's PDF) in
      important points of history.  However, keeping a snapshot of these
      (most probably large volume) outputs in the main history of the
      pipeline can unreasonably bloat it. It is thus recommended to make a
      separate Git repo to keep those files and keep this pipeline's volume
      as small as possible. For example if your main pipeline is called
      `my-exciting-project`, the name of the outputs pipeline can be
      `my-exciting-project-output`. This enables easy sharing of the output
      files with your co-authors (with necessary permissions) and not
      having to bloat your email archive with extra attachments (you can
      just share the link to the online repo in your communications). After
      the research is published, you can also release the outputs pipeline,
      or you can just delete it if it is too large or un-necessary (it was
      just for convenience, and fully reproducible after all). This
      pipeline's output is available for demonstration in the separate
      [reproducible-paper-output](https://gitlab.com/makhlaghi/reproducible-paper-output)
      repository.










Future improvements
===================

This is an evolving project and as time goes on, it will evolve and become
more robust. Here are the list of features that we plan to add in the
future.

 - *Containers*: It is important to have better/full control of the
    environment of the reproduction pipeline. Our current reproducible
    paper pipeline builds the higher-level programs (for example GNU Bash,
    GNU Make, GNU AWK and etc) it needs and sets `PATH` to prefer its own
    builds. It currently doesn't build and use its own version of
    lower-level tools (like the C library and compiler). We plan to add the
    build steps of these low level tools so the system's `PATH` can be
    completely ignored within the pipeline and we are in full control of
    the whole build process. Another solution is based on [an interesting
    tutorial](https://mozillafoundation.github.io/2017-fellows-sf/re-papers/index.html)
    by the Mozilla science lab to build reproducible papers. It suggests
    using the [Nix package manager](https://nixos.org/nix/about.html) to
    build the necessary software for the pipeline and run the pipeline in
    its completely closed environment. This is an interesting solution
    because using Nix or [Guix](https://www.gnu.org/software/guix/) (which
    is based on Nix, but uses the [Scheme
    language](https://en.wikipedia.org/wiki/Scheme_(programming_language)),
    not a custom language for the management) will allow a fully working
    closed environment on the host system which contains the instructions
    on how to build the environment. The availability of the instructions
    to build the programs and environment with Nix or Guix, makes them a
    better solution than binary containers like
    [docker](https://www.docker.com/) which are essentially just a binary
    (not human readable) black box and only usable on the given CPU
    architecture. However, one limitation of using these is their own
    installation (which usually requires root access).










Appendix: Necessity of exact reproduction in scientific research
================================================================

In case [the link above](http://akhlaghi.org/reproducible-science.html) is
not accessible at the time of reading, here is a copy of the introduction
of that link, describing the necessity for a reproduction pipeline like
this (copied on February 7th, 2018):

The most important element of a "scientific" statement/result is the fact
that others should be able to falsify it. The Tsunami of data that has
engulfed astronomers in the last two decades, combined with faster
processors and faster internet connections has made it much more easier to
obtain a result. However, these factors have also increased the complexity
of a scientific analysis, such that it is no longer possible to describe
all the steps of an analysis in the published paper. Citing this
difficulty, many authors suffice to describing the generalities of their
analysis in their papers.

However, It is impossible to falsify (or even study) a result if you can't
exactly reproduce it. The complexity of modern science makes it vitally
important to exactly reproduce the final result. Because even a small
deviation can be due to many different parts of an analysis. Nature is
already a black box which we are trying so hard to comprehend. Not letting
other scientists see the exact steps taken to reach a result, or not
allowing them to modify it (do experiments on it) is a self-imposed black
box, which only exacerbates our ignorance.

Other scientists should be able to reproduce, check and experiment on the
results of anything that is to carry the "scientific" label. Any result
that is not reproducible (due to incomplete information by the author) is
not scientific: the readers have to have faith in the subjective experience
of the authors in the very important choice of configuration values and
order of operations: this is contrary to the scientific spirit.