using Pkg
Pkg.develop(path=".")


using PkgTemplates

t = Template(;
           user="mora200217",
           authors=["Andrés Morales"],
           plugins=[
               License(name="MIT"),
               Git(),
               GitHubActions(),
           ],
       )