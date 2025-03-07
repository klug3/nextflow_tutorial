# nextflow_tutorial

Scripts used to learn Nextflow.

## Source:

`https://training.nextflow.io/latest/basic_training/`

## Notes:

### Version:

Set specific nextflow version:
`export NXF_VER=23.10.1`
Confirm:
`nextflow -version`

### Docker images:

1. Create `dockerfile`, then run `docker build -t klug3/nextflow_tutorial .` to build the image;
2. Modify `nextflow.config `OR specify the docker image as parameter while running nextflow (`-with-docker klug3/nextflow_tutorial`)

### Using external scripts:

To make it work, they need to be accessible through PATH. To do so:

1. Place them in /bin/ directory that is automaticly added to PATH by the Nextflow (don't forget the shebang);
2.
