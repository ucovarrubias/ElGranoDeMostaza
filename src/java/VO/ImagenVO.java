package VO;

import java.io.InputStream;

public class ImagenVO {

    /*Todo los atributos*/
    int codigoimg;
    String nombreimg;
    InputStream archivoimg;
    private byte[] archivoimg2;

    public ImagenVO(int id, String name, byte[] archivo) {
        this.codigoimg = id;
        this.nombreimg = name;
        this.archivoimg2 = archivo;
    }

    public ImagenVO() {
    }

    /*Todo los codigos get*/
    public int getCodigoimg() {
        return codigoimg;
    }

    public String getNombreimg() {
        return nombreimg;
    }

    public InputStream getArchivoimg() {
        return archivoimg;
    }


    /*Todo los codigos set*/
    public void setCodigoimg(int codigoimg) {
        this.codigoimg = codigoimg;
    }

    public void setNombreimg(String nombreimg) {
        this.nombreimg = nombreimg;
    }

    public void setArchivoimg(InputStream archivoimg) {
        this.archivoimg = archivoimg;
    }

    /**
     * @return the archivoimg2
     */
    public byte[] getArchivoimg2() {
        return archivoimg2;
    }

    /**
     * @param archivopdf2 the archivoimg2 to set
     */
    public void setArchivoimg2(byte[] archivoimg2) {
        this.archivoimg2 = archivoimg2;
    }

}
