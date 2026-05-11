@*1% -*- mode: c;-*-
rstrat.

\noindent
|rstrat|.

@<DefinitionModules@>=
int rstratd(strategie_p *strat);

@ @<ImplementationModules@>=
int rstratd(strategie_p *strat)
  {
    FILE *fp;
    char buf[256];
    fp=fopen(".strategie","r");
    if(fp==NULL){
      fprintf(stdout,"#File not found: .strategie\n");
      return(0);
    }
    while(fgets(buf, 256, fp)!=NULL){
      @q printf("#buf=%s",buf);@>
      if (!strncmp(buf,"aktiveobjekte=",(size_t)14)) {
	sscanf(&buf[14],"%d",&strat->aktiveobjekte);
        fprintf(stdout,"#strategie.aktiveobjekte=%d\n",strat->aktiveobjekte);
	strat->besteobjekte=(2*strat->aktiveobjekte+7)/14;
        fprintf(stdout,"#strategie.besteobjekte=%d\n",strat->besteobjekte);
	strat->maxalter=strat->aktiveobjekte*5;
        fprintf(stdout,"#strategie.maxalter=%d\n",strat->maxalter);
      }
      if (!strncmp(buf,"besteobjekte=",(size_t)13)) {
	sscanf(&buf[13],"%d",&strat->besteobjekte);
        fprintf(stdout,"#strategie.besteobjekte=%d\n",strat->besteobjekte);
      }
      if (!strncmp(buf,"maxalter=",(size_t)9)) {
	sscanf(&buf[9],"%d",&strat->maxalter);
        fprintf(stdout,"#strategie.maxalter=%d\n",strat->maxalter);
      }
      if (!strncmp(buf,"sollerfolg=",(size_t)11)) {
	sscanf(&buf[11],"%lg",&strat->sollerfolg);
        fprintf(stdout,"#strategie.sollerfolg=%lg\n",strat->sollerfolg);
      }
      if (!strncmp(buf,"erfolg=",(size_t)7)) {
	sscanf(&buf[7],"%lg",&strat->erfolg);
        fprintf(stdout,"#strategie.erfolg=%lg\n",strat->erfolg);
      }
      if (!strncmp(buf,"erfolgsbewertung=",(size_t)17)) {
	sscanf(&buf[17],"%lg",&strat->erfolgsbewertung);
        fprintf(stdout,"#strategie.erfolgsbewertung=%lg\n",strat->erfolgsbewertung);
      }
      if (!strncmp(buf,"tmess=",(size_t)6)) {
	sscanf(&buf[6],"%lg",&strat->tmess);
        fprintf(stdout,"#strategie.tmess=%lg\n",strat->tmess);
      }
      if (!strncmp(buf,"eamin=",(size_t)6)) {
	sscanf(&buf[6],"%lg",&strat->eamin);
        fprintf(stdout,"#strategie.eamin=%lg\n",strat->eamin);
      }
      if (!strncmp(buf,"ebmin=",(size_t)6)) {
	sscanf(&buf[6],"%lg",&strat->ebmin);
        fprintf(stdout,"#strategie.ebmin=%lg\n",strat->ebmin);
      }
      if (!strncmp(buf,"ebmax=",(size_t)6)) {
	sscanf(&buf[6],"%lg",&strat->ebmax);
        fprintf(stdout,"#strategie.ebmax=%lg\n",strat->ebmax);
      }
      if (!strncmp(buf,"gradinfo=",(size_t)9)) {
	sscanf(&buf[9],"%lg",&strat->gradinfo);
        fprintf(stdout,"#strategie.gradinfo=%lg\n",strat->gradinfo);
      }
      if (!strncmp(buf,"startrwdf=",(size_t)10)) {
	sscanf(&buf[10],"%lg",&strat->startrwdf);
        fprintf(stdout,"#strategie.startrwdf=%lg\n",strat->startrwdf);
      }
      if (!strncmp(buf,"zwischenausg=",(size_t)13)) {
	sscanf(&buf[13],"%d",&strat->zwischenausg);
        fprintf(stdout,"#strategie.zwischenausg=%d\n",strat->zwischenausg);
      }
      if (!strncmp(buf,"verbessausg=",(size_t)12)) {
	sscanf(&buf[12],"%d",&strat->verbessausg);
        fprintf(stdout,"#strategie.verbessausg=%d\n",strat->verbessausg);
      }
      if (!strncmp(buf,"maxnoerf=",(size_t)9)) {
	sscanf(&buf[9],"%ld",&strat->maxnoerf);
        fprintf(stdout,"#strategie.maxnoerf=%ld\n",strat->maxnoerf);
      }
      if (!strncmp(buf,"maxitera=",(size_t)9)) {
	sscanf(&buf[9],"%ld",&strat->maxitera);
        fprintf(stdout,"#strategie.maxitera=%ld\n",strat->maxitera);
      }
    }
    fclose(fp);
    return(0);
  }
